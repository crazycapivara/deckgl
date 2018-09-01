#' Add an icon layer to the deckgl widget
#'
#' The Icon Layer renders raster icons at given coordinates.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/icon-layer}
#'
#' @export
add_icon_layer <- function(deckgl, id = "icon-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "IconLayer", id, data, properties, ...)
}
