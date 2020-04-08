#' Create a tooltip property
#' @inheritParams add_control
#' @param ... not used
#' @export
use_tooltip <- function(html, style, ...) {
  list(
    html = html,
    style = style,
    ...
  )
}
