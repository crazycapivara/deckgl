library(deckgl)
library(sf)

features <- st_as_sf(bart_stations, coords = c("lng", "lat"), crs = 4326)

deckgl(zoom = 9, pitch = 35) %>%
  add_column_layer(
    data = features,
    getPosition = ~geometry,
    getElevation = ~exits,
    getFillColor = JS("d => [48, 128, Math.sqrt(d.exits)]"),
    getTooltip = ~name
  )
