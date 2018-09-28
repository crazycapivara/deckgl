sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-segments.json"

properties <- list(
  pickable = TRUE,
  getStrokeWidth = 12,
  # getSourcePosition = JS("d => d.from.coordinates"),
  getSourcePosition = get_position(coordinates = "from.coordinates"),
  getTargetPosition = JS("d => d.to.coordinates"),
  getColor = JS("d => [Math.sqrt(d.inbound + d.outbound), 140, 0]"),
  onHover = JS("({object}) => console.log(`${object.from.name} to ${object.to.name}`)")
)

deckgl(zoom = 10, pitch = 20) %>%
  add_line_layer(data = sample_data, properties = properties)
