# Scatterplot example
# see also:
# - https://deck.gl/#/documentation/deckgl-api-reference/layers/scatterplot-layer
# -----

library(deckgl)

bart_stations <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

properties <- list(
  getPosition = JS("data => data.coordinates"),
  getRadius = JS("data => Math.sqrt(data.exits)"),
  radiusScale = 6,
  getColor = c(255, 140, 20)
)

deckgl() %>%
  add_scatterplot_layer(data = bart_stations, properties = properties)
