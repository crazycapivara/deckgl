#' Add a data source to the deckgl widget
#'
#' @inheritParams add_layer
#' @param id The unique id of the source.
#' @export
add_source <- function(deckgl, id, data) {
  deckgl$x$sources %<>%
    push(c(id = id, create_source(data)))
  deckgl
}

create_source <- function(data) {
  if (inherits(data, "sf")) {
    data <- modify_sf(data)
  }

  list(
    data = data,
    df = inherits(data, "data.frame")
  )
}
