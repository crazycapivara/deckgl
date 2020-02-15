#' Add a grid cell layer to the deckgl widget
#'
#' The \code{GridCellLayer} can render a grid-based heatmap.
#' It is a variation of the \code{ColumnLayer}. It takes the constant width / height of all cells and top-left coordinate of each cell.
#' The grid cells can be given a height using the \code{getElevation} accessor.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-cell-layer}
#' @example inst/examples/deckgl-api-reference/grid-cell-layer.R
#' @export
add_grid_cell_layer <- function(deckgl, id = "grid-cell-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "GridCellLayer", id, data, properties, ...)
}
