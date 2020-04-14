#' Add a control to the widget
#' @inheritParams add_layer
#' @param html The \code{innerHTML} of the element.
#' @param pos The position of the control. Possible values are \code{top-left}, \code{top-right},
#' \code{bottom-right} and \code{bottom-left}.
#' @param style A \code{cssText} string that will modefiy the default style of the element.
#' @examples
#' deck <- deckgl() %>%
#'   add_basemap() %>%
#'   add_control(
#'     "<h1>Blank Base Map</h1>",
#'     pos = "top-right",
#'     style = "background: #004080; color: white;"
#'   )
#'
#' if (interactive()) deck
#' @export
add_control <- function(deckgl, html, pos = "top-right", style = NULL) {
  invoke_method(deckgl, "addControl", html = html, pos = pos, style = style)
}
