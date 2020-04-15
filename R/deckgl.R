#' Create a deckgl widget
#'
#' @param latitude The latitude of the initial view state.
#' @param longitude The longitude of the initial view state.
#' @param zoom The zoom level of the initial view state.
#' @param pitch The pitch of the initial view state.
#' @param bearing The bearing of the initial view state.
#' @param initial_view_state The initial view state.
#'   If set, other view state arguments (\code{longitude}, \code{latidude} et cetera) are ignored.
#' @param views A single \code{View}, or an array of \code{View} instances.
#'   If not supplied, a single \code{MapView} will be created.
#' @param width The width of the widget.
#' @param height The height of the widget.
#' @param element_id The explicit id of the widget (usually not needed).
#' @param ... Optional properties that are passed to the \code{deck} instance.
#' @return deckgl widget
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/deck} for optional properties
#'   that can be passed to the \code{deck} instance.
#' @export
deckgl <- function(latitude = 37.8, longitude = -122.45, zoom = 12, pitch = 0, bearing = 0,
                   initial_view_state = NULL, views = NULL,
                   width = NULL, height = NULL, element_id = NULL, ...) {
  props <- list(...) %>%
    compact() %>%
    keys_to_camel_case()

  # Create widget data
  x <- list(
    latitude = latitude,
    longitude = longitude,
    zoom = zoom,
    pitch = pitch,
    bearing = bearing,
    initialViewState = initial_view_state,
    views = views,
    properties = props,
    layers = list(),
    sources = list(),
    calls = list()
  )

  # Create widget
  htmlwidgets::createWidget(
    name = "deckgl",
    x,
    width = width,
    height = height,
    package = "deckgl",
    elementId = element_id,
    dependencies = use_deps("deck.gl")
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
