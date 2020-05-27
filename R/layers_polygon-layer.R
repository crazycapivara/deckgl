#' Add a polygon layer to the deckgl widget
#'
#' The \code{PolygonLayer} renders filled and/or stroked polygons.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/polygon-layer}
#' @example inst/examples/deckgl-api-reference/polygon-layer.R
#' @export
add_polygon_layer <- function(deckgl, data = NULL, properties = list(), ..., id = "polygon-layer") {
  add_layer(deckgl, "PolygonLayer", data, properties, ..., id = id)
}
