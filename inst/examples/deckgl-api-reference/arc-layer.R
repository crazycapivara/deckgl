## @knitr arc-layer
sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/master/",
  "website/bart-segments.json"
)

properties <- list(
  pickable = TRUE,
  getStrokeWidth = 12,
  getSourcePosition = get_property("from.coordinates"),
  getTargetPosition = get_property("to.coordinates"),
  getSourceColor = JS("d => [Math.sqrt(d.inbound), 140, 0]"),
  getTargetColor = JS("d => [Math.sqrt(d.outbound), 140, 0]"),
  getTooltip = JS("object => `${object.from.name} to ${object.to.name}`")
)

deck <- deckgl(zoom = 10, pitch = 35) %>%
  add_arc_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
