library(deckgl)
require(geojsonio)

cities <- canada_cities
lat <- cities[1, ]$lat
lng <- cities[1, ]$long

properties <- list(
  pickable = TRUE,
  getPosition = JS("data => [data.long, data.lat]"),
  getRadius = 1000,
  getColor = JS("data => data.capital > 0 ? [165, 42,42] : [70, 130, 180]"),
  radiusScale = 8,
  onHover = JS("({object}) => console.log(object)")
)

# Add your mapbox api token here and uncomment 'add_mapbox_basemap' below
token <- ""

deckgl(latitude = lat, longitude = lng, zoom = 4) %>%
  add_scatterplot_layer(data = cities, properties = properties) # %>% add_mapbox_basemap(token)
