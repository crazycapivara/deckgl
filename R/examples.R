#' @export
hello_world <- function(deckgl, message = "Hello World") {
  deckgl$x$message <- message
  deckgl
}
