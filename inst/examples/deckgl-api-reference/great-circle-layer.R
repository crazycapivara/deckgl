## @knitr great-circle-layer
properties <- list(
  pickable = TRUE,
  getWidth = 12,
  getSourcePosition = get_position("from_lat", "from_lng"),
  getTargetPosition = get_position("to_lat", "to_lng"),
  getSourceColor = JS("d => [Math.sqrt(d.inbound), 140, 0]"),
  getTargetColor = JS("d => [Math.sqrt(d.outbound), 140, 0]"),
  getTooltip = JS("object => `${object.from_name} to ${object.to_name}`")
)

deck <- deckgl(zoom = 10, pitch = 35) %>%
  add_great_circle_layer(data = bart_segments, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
