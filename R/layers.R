#' @export
add_layer <- function(deckgl, class_name, id, data, properties = list()) {
  if (is.data.frame(data)){
    properties$dataframeToD3 = TRUE
  }

  n <- length(deckgl$x$layers)
  deckgl$x$layers[[n + 1]] <- list(
    className = class_name,
    data = data,
    properties = c(id = id, properties)
  )
  deckgl
}
