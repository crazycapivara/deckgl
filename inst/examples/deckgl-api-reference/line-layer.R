## @knitr line-layer
data("bart_segments")

properties <- list(
  pickable = TRUE,
  getWidth = 12,
  getSourcePosition = ~from_lng + from_lat,
  getTargetPosition = ~to_lng + to_lat,
  getColor = JS("d => [Math.sqrt(d.inbound + d.outbound), 140, 0]"),
  tooltip = "{{from_name}}} to {{to_name}}"
)

deck <- deckgl(zoom = 10, pitch = 20) %>%
  add_line_layer(data = bart_segments, properties = properties) %>%
  add_basemap() %>%
  add_control("Line Layer")

if (interactive()) deck
