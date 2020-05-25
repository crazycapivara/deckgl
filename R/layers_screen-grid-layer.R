#' Add a screen grid layer to the deckgl widget
#'
#' The \code{ScreenGridLayer} takes in an array of latitude and longitude coordinated points,
#' aggregates them into histogram bins and renders as a grid.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/screen-grid-layer}
#' @example inst/examples/deckgl-api-reference/screen-grid-layer.R
#' @export
add_screen_grid_layer <- function(deckgl, data = NULL, properties = list(), ..., id = "screen-grid-layer") {
  add_layer(deckgl, "ScreenGridLayer", data, properties, ..., id = id)
}
