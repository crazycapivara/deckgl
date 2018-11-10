## @knitr highway-safety-in-us
library(deckgl)
library(data.table)
library(sf)
library(leaflet)

data_url_root <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/highway/"
)

data_url <- list(
  accidents = paste0(data_url_root, "accidents.csv"),
  roads = paste0(data_url_root, "roads.json")
)

# Prepare data
accidents2010 <- fread(data_url$accidents) %>%
  .[year == 2010, list(state, type, id, fatalities)]

roads <- st_read(data_url$roads, quiet = TRUE) %>%
  as.data.table() %>%
  .[, list(state, type, id, length, geometry)]
roads$geometry <- lapply(roads$geometry, "[[", 1)

setkey(accidents2010, state, type, id)
setkey(roads, state, type, id)

roads <- accidents2010[roads] %>%
  .[, list(fatalities, length, geometry)]
roads[is.na(roads)] <- 0

# Set colors
pal <- colorBin("RdYlBu", domain = accidents2010$fatalities, bins = 6)
roads$color <- pal(roads$fatalities)
roads[fatalities == 0, ]$color <- "#000000"

initial_view_state <- list(
  latitude = 38,
  longitude = -100,
  zoom = 4,
  minZoom = 2,
  maxZoom = 8
)

deck <- deckgl(
  initialViewState = initial_view_state,
  pickingRadius = 5,
  style = list(background = "black")
) %>%
  add_data(roads) %>%
  add_path_layer(
    data = get_data(),
    widthScale = 20,
    widthMinPixels = 2,
    getPath = get_property("geometry"),
    getColor = get_color_to_rgb_array("color"),
    getWidth = 5,
    getTooltip = get_property("fatalities")
  ) # %>% add_mapbox_basemap()

if (interactive()) deck
