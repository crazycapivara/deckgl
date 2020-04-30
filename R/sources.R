#' Add a data source to the deckgl widget
#'
#' @inheritParams add_layer
#' @param id The unique id of the source.
#' @example inst/examples/deckgl-api-reference/sources.R
#' @export
add_source <- function(deckgl, id, data) {
  if (inherits(data, "sf")) data <- modify_sf(data)
  invoke_method(deckgl, "addSource", id = id, data = data, convertData = inherits(data, "data.frame"))
}
