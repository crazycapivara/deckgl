#' @export
deckgl_proxy <- function(shinyId, session = shiny::getDefaultReactiveDomain()) {
  if (is.null(session)) {
    stop("deckgl_proxy must be called from the server function of a Shiny app.")
  }

  if (!is.null(session$ns) &&
      nzchar(session$ns(NULL)) &&
      substring(shinyId, 1, nchar(session$ns(""))) != session$ns("")) {
    shinyId <- session$ns(shinyId)
  }

  structure(
    list(
      session = session,
      id = shinyId,
      x = list(layers = list())
    ),
    class = c("deckgl_proxy", "htmlwidget_proxy")
  )
}

#' @export
test_proxy <- function(proxy, ...) {
  if (!inherits(proxy, "deckgl_proxy")) {
    stop("This function must be used with a deckgl_proxy object.", call. = FALSE)
  }

  proxy$session$sendCustomMessage(
    type = "proxythis",
    message = list(
      id = proxy$id,
      test = list(hi = "I am your proxy", ...),
      x = proxy$x
    )
  )
  proxy
}
