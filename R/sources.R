#' Add a data source to the deckgl widget
#'
#' @inheritParams add_layer
#' @param id The unique id of the source.
#' @export
add_source <- function(deckgl, id, data) {
  if (inherits(data, "sf")) {
    data <- modify_sf(data)
  }

  source <- list(
    id = id,
    df = inherits(data, "data.frame"),
    data = data
  )
  deckgl$x$sources %<>%
    push(source)
  deckgl
}
