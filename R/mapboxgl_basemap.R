#' @export
add_mapbox_basemap <- function(deckgl, token = "", style = "mapbox://styles/mapbox/light-v9") {
  deckgl$dependencies <- c(
    deckgl$dependencies,
    mapboxgl_dependencies()
  )
  deckgl$x$mapboxApiAccessToken = token
  deckgl$x$mapStyle = style
  deckgl
}
