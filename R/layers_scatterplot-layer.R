#' Add a scatterplot layer to the deckgl widget
#'
#' The \code{ScatterplotLayer} takes in paired latitude and longitude coordinated points
#' and renders them as circles with a certain radius.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/scatterplot-layer}
#' @example inst/examples/deckgl-api-reference/scatterplot-layer.R
#' @export
add_scatterplot_layer <- function(deckgl, data = NULL, properties = list(), ..., id = "scatterplot-layer") {
  add_layer(deckgl, "ScatterplotLayer", data, properties, ..., id = id)
}
