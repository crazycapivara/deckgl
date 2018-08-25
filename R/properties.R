#' Create a getPosition property
#'
#' @param latitude latitude key in data object
#' @param longitude longitude key in data object
#' @param coordinates coordinates key in data object
#'   (in the case \code{latitude} and \code{longitude} parameters are ignored)
#'
#' @return getPosition property
#'
#' @export
get_position <- function(latitude = NULL, longitude = NULL, coordinates = NULL) {
  coordinates_ <- is.null(coordinates) %>%
    ifelse(
      sprintf("[data.%s, data.%s]", longitude, latitude),
      sprintf("data.%s", coordinates))
  sprintf("data => %s", coordinates_) %>% JS
}
