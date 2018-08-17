#' @export
add_layer <- function(deckgl, class_name, id, data, properties = list()) {
  n <- length(deckgl$x$layers)
  deckgl$x$layers[[n + 1]] <- list(
    className = class_name,
    properties = c(id = id, data = data, properties)
  )
  deckgl
}

#' @export
add_text_layer <- function(deckgl, id = "text-layer", data = NULL, ...) {
  properties <- list(...)
  if (is.null(data)) {
    data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"
    properties$getPosition <- htmlwidgets::JS("d => d.coordinates")
    properties$getText <- htmlwidgets::JS("d => d.name")
  }
  add_layer(deckgl, "TextLayer", id, data, properties)
}
