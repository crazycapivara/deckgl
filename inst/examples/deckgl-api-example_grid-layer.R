#' -----
#' deckgl GridLayer example
#' see also:
#' - https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer
#' -----

sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

properties <- list(
  pickable = TRUE,
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = JS("d => d.COORDINATES"),
  onHover = JS("({object}) => { if(object) console.log(object.count) }")
)

token <- ""

deckgl(zoom = 11, pitch = 45) %>%
  add_grid_layer(data = sample_data, properties = properties) %>% add_mapbox_basemap(token)
