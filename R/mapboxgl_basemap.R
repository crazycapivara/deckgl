#' Add a basemap from mapbox to the deckgl widget
#'
#' @param deckgl deckgl widget
#' @param style map style
#' @param token mapbox API access token
#' @return deckgl widget
#' @export
add_mapbox_basemap <- function(deckgl, style = "mapbox://styles/mapbox/light-v9",
                               token = Sys.getenv("MAPBOX_API_TOKEN")) {
  deckgl$dependencies <- c(deckgl$dependencies, use_deps("mapbox-gl"))
  deckgl$x$mapStyle <- style
  deckgl$x$mapboxApiAccessToken <- token
  deckgl
}
