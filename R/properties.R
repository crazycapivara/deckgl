#' Create a getPosition data accessor
#'
#' Method called to retrieve the position of each object.
#'
#' @param latitude latitude key in data object
#' @param longitude longitude key in data object
#' @param coordinates coordinates key in data object
#'   (in this case \code{latitude} and \code{longitude} parameters are ignored)
#'
#' @return JavaScript code evaluated on the client-side
#'
#' @export
get_position <- function(latitude = NULL, longitude = NULL, coordinates = NULL) {
  coordinates_ <- is.null(coordinates) %>%
    ifelse(
      sprintf("[data.%s, data.%s]", longitude, latitude),
      sprintf("data.%s", coordinates)
    )
  sprintf("data => %s", coordinates_) %>% JS()
}

#' Create a data accessor
#'
#' Method called to retrieve the value of the given property of each object.
#'
#' @param property property of data object
#'
#' @return JavaScript code evaluated on the client-side
#'
#' @export
get_value <- function(property) {
  sprintf("data => data.%s", property) %>% JS()
}
