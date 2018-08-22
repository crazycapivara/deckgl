#' @export
add_scatterplot_layer <- function(deckgl, id = "scatterplot-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ScatterplotLayer", id, data, properties, ...)
}

