#' Add a JSON-Editor to the deckgl widget
#'
#' Adds a JSON-Editor below the map to interact with the layers of your \code{deck} instance.
#' @inheritParams add_control
#' @param ... Optional args that are passed to the \code{JSONEditor}.
#' @export
add_json_editor <- function(deckgl, ...) {
  deckgl$dependencies <- c(deckgl$dependencies, use_deps("json-editor"))
  invoke_method(deckgl, "addJSONEditor", ...)
}
