# Example TextLayer
# -----
bart_stations <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

properties_text_layer <- list(
  getPosition = JS("data => data.coordinates"),
  getText = JS("data => data.name")
)

#' Add a text layer to the deckgl widget
#'
#' The \code{TextLayer} renders text labels on the map using texture mapping.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/text-layer}
#'
#' @export
add_text_layer <- function(deckgl, id = "text-layer", data = NULL, properties = list(), ...) {
  # use sample data if no data is given
  if (is.null(data)) {
    data <- bart_stations
    properties <- properties_text_layer
  }

  add_layer(deckgl, "TextLayer", id, data, properties, ...)
}
