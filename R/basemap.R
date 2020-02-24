#' Add a basemap to the deckgl widget
#'
#' @inheritParams add_mapbox_basemap
#' @param style The style definition of the map conforming to the Mapbox Style Specification.
#' @param ... not used
#' @export
add_basemap <- function(deckgl, style = use_carto_style(), ...) {
  add_mapbox_basemap(deckgl, style, ...)
}
