#' Add a JSON-editor to the deckgl widget
#'
#' Adds a \code{Ace}-editor in JSON mode to the map to interact with the layers of your \code{deck} instance.
#' @inheritParams add_control
#' @param ... Optional args that are passed to the editor. See \url{https://github.com/ajaxorg/ace/wiki/Configuring-Ace}
#'   for a list of available options.
#' @param style A \code{cssText} string that will modefiy the default style of the container that holds
#'   the editor.
#' @param theme The name of the theme used by the editor.
#' @export
add_json_editor <- function(deckgl, ..., style = "width: 40%;", theme = "idle_fingers") {
  deckgl$dependencies <- c(deckgl$dependencies, use_deps("ace"))
  invoke_method(deckgl, "addJSONEditor", options = list(...), style = style, theme = theme)
}
