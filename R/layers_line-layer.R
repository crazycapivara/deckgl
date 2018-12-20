#' Add a line layer to the deckgl widget
#'
#' The \code{LineLayer} renders flat lines joining pairs of source and target points,
#' specified as latitude/longitude coordinates.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/line-layer}
#'
#' @example inst/examples/deckgl-api-reference/line-layer.R
#'
#' @export
add_line_layer <- function(deckgl, id = "line-layer", data = NULL, properties = list(), ...) {
  if (inherits(data, "sf")) {
    data <- wellknown(data)
    properties$getSourcePosition <- get_wellknown_origin()
    properties$getTargetPosition <- get_wellknown_destination()
  }

  add_layer(deckgl, "LineLayer", id, data, properties, ...)
}
