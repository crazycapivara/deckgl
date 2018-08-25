#' Add a line layer to the deckgl widget
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/line-layer}
#'
#' @export
add_line_layer <- function(deckgl, id = "line-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "LineLayer", id, data, properties, ...)
}
