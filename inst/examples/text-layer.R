library(deckgl)
library(geojsonio)

cities <- geojsonio::canada_cities[canada_cities$capital > 0, ]

lat <- cities[1, ]$lat
lng <- cities[1, ]$long

properties <- list(
  getPosition = JS("data => [data.long, data.lat]"),
  getText = JS("data => `${data.name} (${data.pop})`"),
  getSize = 20
)

deckgl(latitude = lat, longitude = lng, zoom = 4) %>%
  add_text_layer(data = cities, properties = properties) %>%
  # combine layers, TODO: move to separate example
  add_scatterplot_layer(
    data = cities, properties = properties,
    getRadius = 1400, radiusScale = 12, getColor = c(255, 140, 0)
  )
