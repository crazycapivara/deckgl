#' Add a h3 cluster layer to the deckgl widget
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/h3-cluster-layer}
#' @example inst/examples/deckgl-api-reference/h3-cluster-layer.R
#' @export
add_h3_cluster_layer <- function(deckgl, id = "h3-cluster-layer", data = NULL, properties = list(), ...) {
  deckgl$dependencies <- c(use_deps("h3-js"), deckgl$dependencies)
  add_layer(deckgl, "H3ClusterLayer", id, data, properties, ...)
}
