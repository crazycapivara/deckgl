#' Create a deckgl proxy object
#'
#' Creates a deckgl-like object that can be used to update a deckgl object that has already been rendered.
#'
#' @param shinyId single-element character vector indicating the output ID of the
#'   deck to modify
#' @param session the \code{Shiny} session object to which the deckgl widget belongs;
#'   usually the default value will suffice.
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
      x = list(
        calls = list(),
        layers = list()
      )
    ),
    class = c("deckgl_proxy", "htmlwidget_proxy")
  )
}

#' Send commands to a deckgl instance in a \code{Shiny} app
#'
#' @param proxy deckgl proxy object
#' @param ... unused
#' @seealso \link{deckgl_proxy}
#' @export
update_deckgl <- function(proxy, ...) {
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
