#' Add a great circle layer to the deckgl widget
#'
#' The \code{GreatCircleLayer} is a variation of the \code{ArcLayer}.
#' It renders flat arcs along the great circle joining pairs of source
#' and target points, specified as latitude/longitude coordinates.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/great-circle-layer}
#' @example inst/examples/deckgl-api-reference/great-circle-layer.R
#' @export
add_great_circle_layer <- function(deckgl, id = "great-circle-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "GreatCircleLayer", id, data, properties, ...)
}
