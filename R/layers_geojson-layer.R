#' Add a geojson layer to the deckgl widget
#'
#' The \code{GeoJsonLayer} takes in \href{https://geojson.org}{GeoJson} formatted data
#' and renders it as interactive polygons, lines and points.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/geojson-layer}
#' @example inst/examples/deckgl-api-reference/geojson-layer.R
#' @export
add_geojson_layer <- function(deckgl, data = NULL, properties = list(), ..., id = "geojson-layer") {
  add_layer(deckgl, "GeoJsonLayer", data, properties, ..., id = id)
}
