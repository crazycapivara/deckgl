#' Add an arc layer to the deckgl widget
#'
#' The \code{ArcLayer} renders raised arcs joining pairs of source and target points,
#' specified as latitude/longitude coordinates.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/arc-layer}
#'
#' @export
add_arc_layer <- function(deckgl, id = "arc-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ArcLayer", id, data, properties, ...)
}
