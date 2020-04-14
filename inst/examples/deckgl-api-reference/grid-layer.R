## @knitr grid-layer
data("sf_bike_parking")

properties <- list(
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = ~lng + lat,
  tooltip = "{{position.0}}, {{position.1}}<br/>Count: {{count}}"
)

deck <- deckgl(zoom = 11, pitch = 45, bearing = 35) %>%
  add_grid_layer(data = sf_bike_parking, properties = properties) %>%
  add_control("Grid Layer") %>%
  add_basemap()

if (interactive()) deck
