#' Add a data source to the deckgl widget
#'
#' @inheritParams add_layer
#' @param id The unique id of the source.
#' @export
add_source <- function(deckgl, id, data) {
  #source <- create_source(data)
  if (inherits(data, "sf")) data <- modify_sf(data)

  invoke_method(deckgl, "addSource", id = id, data = data, convertData = inherits(data, "data.frame"))
}

#create_source <- function(data) {
#  if (inherits(data, "sf")) {
#    data <- modify_sf(data)
#  }
#
#  list(
#    data = data,
#    df = inherits(data, "data.frame")
#  )
#}
