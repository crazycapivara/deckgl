#' @export
add_geojson_layer <- function(deckgl, id = "geojson-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "GeoJsonLayer", id, data, properties, ...)
}
