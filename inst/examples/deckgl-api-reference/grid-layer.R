## @knitr grid-layer
data("sf_bike_parking")

properties <- list(
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = ~lng + lat,
  getTooltip = JS("object => `${object.position.join(', ')}<br/>Count: ${object.count}`"),
  fixedTooltip = TRUE
)

deck <- deckgl(zoom = 11, pitch = 45, bearing = 35) %>%
  add_grid_layer(data = sf_bike_parking, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
