#' Add any kind of layer to the deckgl widget
#'
#' Generic function to add any kind of layer to the deckgl widget.
#' Usually you will not use this one but any of the \code{add_*_layer} functions instead.
#'
#' @param deckgl deckgl widget
#' @param class_name name of the js layer class, e. g. \code{ScatterplotLayer}
#' @param id id of the layer
#' @param data url to fetch data from or data object
#' @param properties named list of properties with names corresponding to the properties defined
#'   in the \href{https://deck.gl/#/documentation/deckgl-api-reference}{deckgl-api-reference}
#'   for the given layer class, additionally there is a \code{getTooltip} property (callback)
#'   showing a tooltip when the mouse enters an object,
#'   e. g. \code{getTooltip = JS("object => object.name")}
#' @param ... more properties (will be added to the properties object), useful if you
#'   want to use a properties object for more than one layer
#'
#' @return deckgl widget
#'
#' @export
add_layer <- function(deckgl, class_name, id, data, properties = list(), ...) {
  properties <- merge_properties(properties, list(...))
  if (!is.null(properties$getTooltip) && is.null(properties$pickable)) {
    properties$pickable <- TRUE
  }

  if (is.data.frame(data)) {
    properties$dataframeToD3 <- TRUE
  }

  n <- length(deckgl$x$layers)
  deckgl$x$layers[[n + 1]] <- list(
    className = class_name,
    data = data,
    properties = c(id = id, properties)
  )
  deckgl
}

# Merge properties overwriting duplicates
merge_properties <- function(x, y) {
  for (name in names(y)) {
    x[[name]] <- y[[name]]
  }
  x
}
