#' Add a grid layer to the deckgl widget
#'
#' The \code{GridLayer} renders a grid heatmap based on an array of points. It takes the constant size all each cell, projects points into cells.
#' The color and height of the cell is scaled by number of points it contains.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer}
#'
#' @example inst/examples/deckgl-api-reference/grid-layer.R
#'
#' @export
add_grid_layer <- function(deckgl, id = "grid-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "GridLayer", id, data, properties, ...)
}
