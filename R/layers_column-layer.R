#' Add a column layer to the deckgl widget
#'
#' The \code{ColumnLayer} can be used to render a heatmap of vertical cylinders.
#' It renders a tesselated regular polygon centered at each given position (a "disk"), and extrude it in 3d.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/column-layer}
#' @example inst/examples/deckgl-api-reference/column-layer.R
#' @export
add_column_layer <- function(deckgl, id = "column-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ColumnLayer", id, data, properties, ...)
}
