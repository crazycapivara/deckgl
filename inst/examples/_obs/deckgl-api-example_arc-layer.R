#' -----
#' deckgl ArcLayer example
#' see also:
#' - https://deck.gl/#/documentation/deckgl-api-reference/layers/arc-layer
#' -----

sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-segments.json"

properties <- list(
  pickable = TRUE,
  getStrokeWidth = 12,
  getSourcePosition = JS("d => d.from.coordinates"),
  getTargetPosition = JS("d => d.to.coordinates"),
  getSourceColor = JS("d => [Math.sqrt(d.inbound), 140, 0]"),
  getTargetColor = JS("d => [Math.sqrt(d.outbound), 140, 0]"),
  # onHover = JS("({object}) => console.log(`${object.from.name} to ${object.to.name}`)")
  getTooltip = JS("object => `${object.from.name} to ${object.to.name}`")
)

token <- ""

deckgl(zoom = 10, pitch = 35) %>%
  # add_layer("ArcLayer", "arc-layer", sample_data, properties) %>% add_mapbox_basemap(token)
  add_arc_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap(token)
