#' Add a basemap to the deckgl widget
#' @param style The style definition of the map conforming to the Mapbox Style Specification.
#' @param ... not used
#' @export
add_basemap <- function(style = use_carto_style(), ...) {
  add_mapbox_basemap(style, ...)
}
