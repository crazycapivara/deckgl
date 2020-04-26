#' Add a JSON-Editor to the deckgl widget
#'
#' Adds a JSON-Editor below the map to interact with the layers of your \code{deck} instance.
#' @inheritParams add_control
#' @param ... Optional args that are passed to the \code{JSONEditor}.
#' @param style A \code{cssText} string that will modefiy the default style of the container that holds
#'   the editor.
#' @export
add_json_editor <- function(deckgl, ..., style = "width: 50%;") {
  deckgl$dependencies <- c(deckgl$dependencies, use_deps(c("json-editor", "ace")))
  invoke_method(deckgl, "addJSONEditor", options = list(...), style = style)
}
