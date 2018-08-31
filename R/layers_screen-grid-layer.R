#' Add a screen grid layer to the deckgl widget
#'
#' The Screen Grid Layer takes in an array of latitude and longitude coordinated points,
#' aggregates them into histogram bins and renders as a grid.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/screen-grid-layer}
#'
#' @export
add_screen_grid_layer <- function(deckgl, id = "screen-grid-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ScreenGridLayer", id, data, properties, ...)
}
