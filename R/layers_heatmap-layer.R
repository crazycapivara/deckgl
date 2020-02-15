#' Add a heatmap layer to the deckgl widget
#'
#' The \code{HeatmapLayer} can be used to visualize spatial distribution of data.
#' It internally implements Gaussian Kernel Density Estimation to render heatmaps.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/heatmap-layer}
#'
#' @example inst/examples/deckgl-api-reference/heatmap-layer.R
#'
#' @export
add_heatmap_layer <- function(deckgl, id = "heatmap-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "HeatmapLayer", id, data, properties, ...)
}
