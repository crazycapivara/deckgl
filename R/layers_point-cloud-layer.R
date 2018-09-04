#' Add a point cloud layer to the deckgl widget
#'
#' The Point Cloud Layer takes in points with 3d positions, normals and colors and renders them as spheres with a certain radius.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/point-cloud-layer}
#'
#' @export
add_point_cloud_layer <- function(deckgl, id = "point-cloud-layer", data = NULL, properties = list(), ...) {
  add_layer(deckgl, "PointCloudLayer", id, data, properties, ...)
}