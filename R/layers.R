#' @export
add_layer <- function(deckgl, class_name, id, data, options = list()) {
  n <- length(deckgl$x$layers)
  deckgl$x$layers[[n + 1]] <- list(
    className = class_name,
    id = id,
    data = data,
    args = options
  )
  deckgl
}

#' @export
add_text_layer <- function(deckgl, id = "text-layer", data = NULL, ...) {
  options <- list(...)
  if (is.null(data)) {
    data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"
    options$getPosition <- htmlwidgets::JS("d => d.coordinates")
    options$getText <- htmlwidgets::JS("d => d.name")
  }
  add_layer(deckgl, "TextLayer", id, data, options)
}
