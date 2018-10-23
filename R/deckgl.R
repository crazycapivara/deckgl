#' Create a deckgl widget
#'
#' @param latitude latitude of the initial view state
#' @param longitude longitude of the initial view state
#' @param zoom zoom of the initial view state
#' @param pitch pitch of the initial view state
#' @param bearing bearing of the initial view state
#' @param initialViewState initial view state,
#'   if set, other view state arguments (\code{longitude}, \code{latidude} etc.) are ignored
#' @param views a single \code{View}, or an array of \code{View} instances,
#'   if not supplied, a single \code{MapView} will be created
#' @param width width of the widget
#' @param height height of the widget
#' @param elementId explicit element id (usually not needed)
#' @param ... optional properties passed to the deck instance
#'
#' @return deckgl widget
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/deck}
#'
#' @import htmlwidgets
#'
#' @export
deckgl <- function(latitude = 37.8, longitude = -122.45, zoom = 12, pitch = 0, bearing = 0,
                   initialViewState = NULL, views = NULL,
                   width = NULL, height = NULL, elementId = NULL, ...) {

  # forward options using x
  x <- list(
    latitude = latitude,
    longitude = longitude,
    zoom = zoom,
    pitch = pitch,
    bearing = bearing,
    initialViewState = initialViewState,
    views = views,
    properties = list(...),
    layers = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = "deckgl",
    x,
    width = width,
    height = height,
    package = "deckgl",
    elementId = elementId
  )
}

#' Shiny bindings for deckgl
#'
#' Output and render functions for using deckgl within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a deckgl
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name deckgl-shiny
#'
#' @export
deckglOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "deckgl", width, height, package = "deckgl")
}

#' @rdname deckgl-shiny
#' @export
renderDeckgl <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, deckglOutput, env, quoted = TRUE)
}
