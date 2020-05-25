#' Add a bitmap layer to the deckgl widget
#'
#' @inheritParams add_layer
#' @param image image
#' @example inst/examples/deckgl-api-reference/bitmap-layer.R
#' @export
add_bitmap_layer <- function(deckgl, image = NULL, properties = list(), ..., id = "h3-hexagon-layer") {
  add_layer(deckgl, "BitmapLayer", data = NULL, properties = c(properties, image = image), ..., id = id)
}
