library(tibble)

data_url <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/hexagons.json"
df <- jsonlite::fromJSON(data_url) %>%
  as_tibble()

hexagon_centroids <- cbind(
  do.call(rbind, df$centroid) %>% as.data.frame() %>% setNames(c("lng", "lat")),
  value = df$value
) %>% as_tibble()

# column layer
deckgl(zoom = 11, pitch = 35) %>%
  add_column_layer(
    data = hexagon_centroids,
    diskResolution = 12,
    getPosition = ~lng + lat,
    getElevation = ~value,
    getFillColor = JS("d => [48, 128, d.value * 255, 255]"),
    elevationScale = 5000,
    radius = 250,
    extruded = TRUE
  )

# grid cell layer
deckgl(zoom = 11, pitch = 35) %>%
  add_grid_cell_layer(
    data = hexagon_centroids,
    getPosition = ~lng + lat,
    getElevation = ~value,
    getFillColor = JS("d => [48, 128, d.value * 255, 255]"),
    elevationScale = 5000,
    cellSize = 250,
    extruded = TRUE
  )
