# Example 'PolygonLayer' using generic function 'add_layer'
# see also:
# - http://deck.gl/#/documentation/deckgl-api-reference/layers/polygon-layer
# -----

library(deckgl)

data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-zipcodes.json"

properties <- list(
  pickable = TRUE,
  stroked = TRUE,
  filled = TRUE,
  wireframe = TRUE,
  lineWidthMinPixels = 1,
  getPolygon = JS("d => d.contour"),
  getElevation = JS("d => d.population / d.area / 10"),
  getFillColor = JS("d => [d.population / d.area / 60, 140, 0]"),
  getLineColor = c(80, 80, 80),
  getLineWidth = 1
)

layer_class <- "PolygonLayer"

deckgl(zoom = 10, pitch = 35) %>%
  add_layer(layer_class, "polygon-layer", data, properties)
