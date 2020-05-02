#' Add a legend to the deckgl widget
#'
#' @inheritParams add_control
#' @param colors The colors of the legend items.
#' @param labels The labels corresponding to the colors of the legend items.
#' @param title The title of the legend.
#' @param ... not used
#' @export
add_legend <- function(deckgl, colors, labels, title = NULL, pos = "top-right", style = NULL, ...) {
  items <- lapply(1:length(colors), function(i) list(color = colors[i], label = labels[i]))
  invoke_method(deckgl, "addLegend", items = items, title = title, pos = pos, style = style, ...)
}
