#' Add an arc layer to the deckgl widget
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/arc-layer}
#'
#' @export
add_arc_layer <- function(deckgl, id = "arc-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ArcLayer", id, data, properties, ...)
}
