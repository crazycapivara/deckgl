#' @export
add_layer <- function(deckgl, class_name, id, data, properties = list()) {
  n <- length(deckgl$x$layers)
  deckgl$x$layers[[n + 1]] <- list(
    className = class_name,
    properties = c(id = id, data = data, properties)
  )
  deckgl
}
