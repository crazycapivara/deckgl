#' Add arc layer to the deckgl widget
#'
#' @export
add_arc_layer <- function(deckgl, id = "arc-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ArcLayer", id, data, properties, ...)
}
