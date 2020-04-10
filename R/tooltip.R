#' Create a tooltip property
#'
#' @inheritParams add_control
#' @param ... not used
#'
#' @section Tooltip template Syntax:
#' The tooltip string is a \emph{mustache} template in which variable names are identified
#' by the double curly brackets (\emph{mustache} tags) that surround them. The variable names available to the
#' template are given by deck.gl’s \code{pickingInfo.object} and vary by layer.
#'
#' @seealso \href{https://github.com/janl/mustache.js}{mustache} for a complete syntax overwiew.
#'
#' @examples
#' data("bart_segments")
#'
#' props <- list(
#'   tooltip = use_tooltip(
#'     html = "{{from_name}} to {{to_name}}",
#'     style = "background: steelBlue; border-radius: 5px;"
#'   )
#' )
#'
#' # The picking object of the hexagon layer offers
#' # a property that contains the list of points of the hexagon.
#' # You can iterate over this list as shown below.
#' data("sf_bike_parking")
#'
#' html = "
#'   <p>{{position.0}}, {{position.1}}<p>
#'   <p>Count: {{points.length}}</p>
#'   <p>{{#points}}<div>{{address}}</div>{{/points}}</p>
#' "
#' @export
use_tooltip <- function(html, style, ...) {
  list(
    html = html,
    style = style,
    ...
  )
}
