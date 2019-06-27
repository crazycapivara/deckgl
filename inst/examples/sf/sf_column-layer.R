library(deckgl)
library(sf)

features <- st_as_sf(bart_stations, coords = c("lng", "lat"), crs = 4326)

deckgl() %>%
  add_column_layer(
    data = features,
    getPosition = get_property("geometry"),
    getFillColor = JS("d => [48, 128, Math.sqrt(d.exits)]"),
    getTooltip = get_property("name")
  )
