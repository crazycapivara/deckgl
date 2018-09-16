#' Encode atlas image to base64
#'
#' @param filename filename of atlas image
#'
#' @return base64 encoded atlas image
#'
#' @export
encode_icon_atlas <- function(filename = NULL) { # nocov start
  if (is.null(filename)) {
    filename <- system.file("icons/icon-atlas.png", package = "deckgl")
  }

  paste("data:image/png;base64,", base64enc::base64encode(filename))
} # nocov end

#' Icon definition on an atlas image
#'
#' @param x x position of icon on the atlas image
#' @param y y position of icon on the atlas image
#' @param width width of icon on the atlas image
#' @param height height of icon on the atlas image
#' @param anchorX horizontal position of icon anchor
#' @param anchorY vertical position of icon anchor
#' @param mask whether icon is treated as a transparency mask,
#'   if \code{TRUE}, user defined color is applied,
#'   if \code{FALSE}, pixel color from the image is applied
#'
#' @export
icon_definition <- function(x = 0, y = 0, width = 128, height = 128, anchorX = (width / 2), anchorY = 128, mask = TRUE) {
  list(
    x = x,
    y = y,
    width = width,
    height = height,
    anchorX = anchorX,
    anchorY = anchorY,
    mask = mask
  )
}
