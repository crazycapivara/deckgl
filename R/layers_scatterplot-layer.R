#' Add a scatterplot layer to the deckgl widget
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/scatterplot-layer}
#'
#' @export
add_scatterplot_layer <- function(deckgl, id = "scatterplot-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "ScatterplotLayer", id, data, properties, ...)
}

