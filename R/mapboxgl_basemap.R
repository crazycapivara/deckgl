#' Add a base map from mapbox to the deckgl widget
#'
#' @param deckgl deckgl widget
#' @param token mapbox api access token
#' @param style map style
#'
#' @return deckgl widget
#'
#' @export
add_mapbox_basemap <- function(deckgl, token = Sys.getenv("MAPBOX_API_TOKEN"), style = "mapbox://styles/mapbox/light-v9") {
  deckgl$dependencies <- c(
    deckgl$dependencies,
    mapboxgl_dependencies()
  )
  deckgl$x$mapboxApiAccessToken <- token
  deckgl$x$mapStyle <- style
  deckgl
}
