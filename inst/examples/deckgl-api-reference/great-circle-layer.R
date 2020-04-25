## @knitr great-circle-layer
data("bart_segments")

properties <- list(
  pickable = TRUE,
  getWidth = 12,
  getSourcePosition = ~from_lng + from_lat,
  getTargetPosition = ~to_lng + to_lat,
  getSourceColor = JS("d => [Math.sqrt(d.inbound), 140, 0]"),
  getTargetColor = JS("d => [Math.sqrt(d.outbound), 140, 0]"),
  getTooltip = "{{from_name}} to {{to_name}}"
)

deck <- deckgl(zoom = 10, pitch = 35) %>%
  add_great_circle_layer(data = bart_segments, properties = properties) %>%
  add_control("Great Circle Layer") %>%
  add_basemap()

if (interactive()) deck
