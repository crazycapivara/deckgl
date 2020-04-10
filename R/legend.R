#' Add a legend to the map
#'
#' @inheritParams add_control
#' @param colors The colors of the legend items.
#' @param labels The labels corresponding to the colors of the legend items.
#' @param title The title of the legend.
#' @param ... not used
#' @export
add_legend <- function(deckgl, colors, labels, title = NULL, style = NULL, ...) {
  items <- lapply(1:length(colors), function(i) list(color = colors[i], label = labels[i]))
  invoke_method(deckgl, "addLegend", items, title, style, ...)
}
