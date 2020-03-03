#' Add an icon layer to the deckgl widget
#'
#' The \code{IconLayer} renders raster icons at given coordinates.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/icon-layer}
#' @example inst/examples/deckgl-api-reference/icon-layer.R
#' @export
add_icon_layer <- function(deckgl, id = "icon-layer", data = NULL,
                           properties = use_default_icon_properties(), ...) {
  if (is.null(properties$iconAtlas) && is.null(list(...)$iconAtlas)) {
    properties <- utils::modifyList(use_default_icon_properties(), properties)
  }

  add_layer(deckgl, "IconLayer", id, data, properties, ...)
}

#' Use default icon properties
#'
#' Returns icon properties with default values for \code{iconAtlas}, \code{iconMapping}
#' and \code{getIcon}, so that the default icon is used.
#'
#' @param sizeScale icon size multiplier
#' @param getSize height of each object (in pixels),
#'   if a number is provided, it is used as the size for all objects,
#'   if a function is provided, it is called on each object to retrieve its size
#' @param getColor rgba color of each object,
#'   if an array is provided, it is used as the color for all objects
#'   if a function is provided, it is called on each object to retrieve its color
#' @export
use_default_icon_properties <- function(sizeScale = 15, getSize = 5, getColor = c(240, 140, 0)) {
  list(
    iconAtlas = encode_icon_atlas(),
    iconMapping = list(marker = use_icon_definition()),
    getIcon = JS("d => 'marker'"),
    sizeScale = sizeScale,
    getSize = getSize,
    getColor = getColor
  )
}
