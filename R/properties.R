#' Create a getPosition data accessor
#'
#' Method called to retrieve the position of each object.
#'
#' @param latitude latitude property of data object
#' @param longitude longitude property of data object
#' @param coordinates coordinates property of data object
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

#' Create a getColor data accessor
#'
#' Method called to retrieve the color of each object.
#' Parses the HEX color retrieved from the data object to an rgb color array.
#'
#' @param color_property property of data object containing the HEX color
#'
#' @return JavaScript code evaluated on the client-side
#'
#' @export
get_color_to_rgb_array <- function(color_property) {
  sprintf("d => deckglWidget.colorToRGBArray(d.%s)", color_property) %>% JS()
}
