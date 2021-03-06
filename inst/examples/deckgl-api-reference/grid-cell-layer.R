hexagon_centroids <- system.file("sample-data/centroids.csv", package = "deckgl") %>%
  read.csv()

deck <- deckgl(zoom = 11, pitch = 35) %>%
  add_grid_cell_layer(
    data = hexagon_centroids,
    getPosition = ~lng + lat,
    getElevation = ~value,
    getFillColor = "@=[48, 128, value * 255, 255]",
    elevationScale = 5000,
    cellSize = 250,
    extruded = TRUE,
    tooltip = "{{value}}"
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
