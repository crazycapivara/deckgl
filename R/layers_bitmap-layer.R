#' Add a bitmap layer to the deckgl widget
#' @inheritParams add_layer
#' @param image image
#' @example inst/examples/deckgl-api-reference/bitmap-layer.R
#' @export
add_bitmap_layer <- function(deckgl, id = "h3-hexagon-layer", image = NULL, properties = list(), ...) {
  add_layer(deckgl, "BitmapLayer", id, data = NULL, properties = c(properties, image = image), ...)
}
