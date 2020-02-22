hexagon_centroids <- system.file("sample-data/centroids.csv", package = "deckgl") %>%
  read.csv()

deck <- deckgl(zoom = 11, pitch = 35) %>%
  add_grid_cell_layer(
    data = hexagon_centroids,
    getPosition = ~lng + lat,
    getElevation = ~value,
    getFillColor = JS("d => [48, 128, d.value * 255, 255]"),
    elevationScale = 5000,
    cellSize = 250,
    extruded = TRUE,
    getTooltip = JS("object => `height: ${object.value * 5000}m`")
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
