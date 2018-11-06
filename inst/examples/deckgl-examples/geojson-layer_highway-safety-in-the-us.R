data_url_accidents <- 'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/highway/accidents.csv'
data_url_roads <- 'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/highway/roads.json'

accidents <- data.table::fread(data_url_accidents)
roads <- sf::st_read(data_url_roads) %>% data.table::as.data.table()

roads_test <- sf::st_read(data_url_roads)

accidents2010 <- accidents[year == 2010,]
data.table::setkey(accidents2010, type, id, state)
data.table::setkey(roads, type, id, state)

data <- roads[accidents2010] %>%
  sf::st_as_sf() %>%
  geojsonio::geojson_json()

merge(accidents2010, roads, by.x = c("type","id", "state"), by.y = c("type","id", "state"))

#accidents2010$key <- sprintf("%s%i%s", accidents2010[, "type"], "id", "state")])

initial_view_state <- list(
  latitude = 38,
  longitude = -100,
  zoom = 4,
  minZoom = 2,
  maxZoom = 8
)

deckgl(initialViewState = initial_view_state) %>%
  add_geojson_layer(
    data = data, # data_url_roads,
    opacity =  1,
    stroked = FALSE,
    filled = FALSE,
    lineWidthMinPixels = 0.5,
    getLineColor = c(240, 140, 20),
    getLineWidth = JS("d => d.properties.fatalities") # 20
  )
