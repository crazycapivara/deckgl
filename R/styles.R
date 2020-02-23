#' Use a Carto style
#'
#' @param theme The theme of the style, \code{dark-matter}, \code{positron} or \code{voyager}.
#' @export
use_carto_style <- function(theme = "dark-matter") {
  if (!theme %in% c("dark-matter", "voyager", "positron")) {
    stop("Unknown theme.")
  }

  sprintf("https://basemaps.cartocdn.com/gl/%s-gl-style/style.json", theme)
}
