#' Add a h3 hexagon layer to the deckgl widget
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/h3-hexagon-layer}
#' @example inst/examples/deckgl-api-reference/h3-hexagon-layer.R
#' @export
add_h3_hexagon_layer <- function(deckgl, id = "h3-hexagon-layer", data = NULL, properties = list(), ...) {
  deckgl$dependencies <- c(use_deps("h3-js"), deckgl$dependencies)
  add_layer(deckgl, "H3HexagonLayer", id, data, properties, ...)
}
