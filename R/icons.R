#' Encode atlas image to base64
#'
#' @param filename The filename of the atlas image.
#' @return base64 encoded atlas image
#' @export
encode_icon_atlas <- function(filename = NULL) { # nocov start
  if (is.null(filename)) {
    filename <- system.file("icons/icon-atlas.png", package = "deckgl")
  }

  paste("data:image/png;base64,", base64enc::base64encode(filename))
} # nocov end

#' Create an icon definition on an atlas image
#'
#' @param x The x position of the icon on the atlas image.
#' @param y The y position of the icon on the atlas image.
#' @param width The width of the icon on the atlas image.
#' @param height The height of the icon on the atlas image.
#' @param anchor_x The horizontal position of the icon anchor.
#' @param anchor_y the vertical position of the icon anchor.
#' @param mask whether icon is treated as a transparency mask,
#'   if \code{TRUE}, user defined color is applied,
#'   if \code{FALSE}, pixel color from the image is applied
#' @export
use_icon_definition <- function(x = 0, y = 0, width = 128, height = 128,
                                anchor_x = (width / 2), anchor_y = 128, mask = TRUE) {
  list(
    x = x,
    y = y,
    width = width,
    height = height,
    anchorX = anchor_x,
    anchorY = anchor_y,
    mask = mask
  )
}
