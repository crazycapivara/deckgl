data("bart_stations")

properties <- list(
  extruded = TRUE,
  cellSize = 50,
  getPosition = ~lng + lat,
  getFillColor = JS("d => [48, 128, Math.min(200, d.spaces * 10)]"),
  getElevation = ~spaces
)

map <- deckgl(zoom = 11, pitch = 45) %>%
  add_grid_cell_layer(data = sf_bike_parking, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) map
