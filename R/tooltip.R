#' Create a tooltip property
#'
#' @inheritParams add_control
#' @param ... not used
#'
#' @section Tooltip template Syntax:
#' The tooltip template is a string in which variable names are identified
#' by the double curly brackets that surround them. The variable names available to the
#' template are given by deck.gl’s \code{pickingInfo.object} and vary by layer.
#'
#' @examples
#' data("bart_segments")
#'
#' props <- list(
#'   tooltip = use_tooltip(
#'     html = "{{from_name}} to {{to_name}}",
#'     "{{from_name}} to {{to_name}}"
#'   )
#' )
#' @export
use_tooltip <- function(html, style, ...) {
  list(
    html = html,
    style = style,
    ...
  )
}
