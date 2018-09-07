#' Add an icon layer to the deckgl widget
#'
#' The Icon Layer renders raster icons at given coordinates.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/icon-layer}
#'
#' @export
add_icon_layer <- function(deckgl, id = "icon-layer", data = NULL, properties = list(), ...) {
  properties <- properties_icon(properties, ...)
  add_layer(deckgl, "IconLayer", id, data, properties, ...)
}

# TODO: Maybe export function as 'default_icon_properties'
properties_icon <- function(properties = list(), ...) {
  if (c(properties, list(...))$iconAtlas %>% is.null()) {
    properties$defaultIcon <- TRUE
    properties$iconAtlas <- encode_icon_atlas()
    properties$iconMapping <- list(marker = icon_definition())
    properties$getIcon <- JS("d => 'marker'")
    properties$getColor <- c(240, 140, 0)
    properties$sizeScale <- 15
    properties$getSize <- 5
  }

  properties
}
