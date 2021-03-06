#' Add a path layer to the deckgl widget
#'
#' The \code{PathLayer} takes in lists of coordinate points and renders them as extruded lines with mitering.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/path-layer}
#' @example inst/examples/deckgl-api-reference/path-layer.R
#' @export
add_path_layer <- function(deckgl, data = NULL, properties = list(), ..., id = "path-layer") {
  add_layer(deckgl, "PathLayer", data, properties, ..., id = id)
}
