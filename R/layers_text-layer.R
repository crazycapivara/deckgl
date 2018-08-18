# Example TextLayer
# -----
bart_stations <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

properties_text_layer <- list(
  getPosition = htmlwidgets::JS("data => data.coordinates"),
  getText = htmlwidgets::JS("data => data.name")
)

#' @export
add_text_layer <- function(deckgl, id = "text-layer", data = NULL, ...) {
  properties <- list(...)
  if (is.null(data)) {
    data <- bart_stations
    properties <- properties_text_layer
  }
  add_layer(deckgl, "TextLayer", id, data, properties)
}
