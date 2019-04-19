#' Add a h3 hexagon layer to the deckgl widget
#' @inheritParams add_layer
#' @export
add_h3_hexagon_layer <- function(deckgl, id = "h3-hexagon-layer", data = NULL, properties = list(), ...) {
  deckgl$dependencies <- c(h3_dependencies(), deckgl$dependencies)
  add_layer(deckgl, "H3HexagonLayer", id, data, properties, ...)
}
