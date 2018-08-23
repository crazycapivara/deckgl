#' Add a grid layer to the deckgl widget
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer}
#'
#' @export
add_grid_layer <- function(deckgl, id = "grid-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "GridLayer", id, data, properties, ...)
}
