#' Add a contour layer to the deckgl widget
#'
#' The \code{ContourLayer} renders contour lines for a given threshold and cell size.
#' Internally it implements \href{https://en.wikipedia.org/wiki/Marching_squares}{Marching Squares} algorithm to generate contour line segments
#' and feeds them into \code{LineLayer} to render lines.
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/contour-layer}
#' @example inst/examples/deckgl-api-reference/contour-layer.R
#' @export
add_contour_layer <- function(deckgl, id = "contour-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ContourLayer", id, data, properties, ...)
}

#' Create a contour definition
#'
#' @param threshold The threshold value used in contour generation.
#' @param color The RGB color array used to render contour lines.
#' @param stroke_width The width of the contour lines in pixels.
#' @export
use_contour_definition <- function(threshold = 1, color = c(255, 255, 255), stroke_width = 1) {
  list(
    threshold = threshold,
    color = color,
    strokeWidth = stroke_width
  )
}
