#' Add a text geojson to the deckgl widget
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/geojson-layer}
#'
#' @export
add_geojson_layer <- function(deckgl, id = "geojson-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "GeoJsonLayer", id, data, properties, ...)
}
