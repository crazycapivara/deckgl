#' Create a data accessor retrieving the first element of an array
#'
#' @param property_name property name of data object
#' @return JavaScript code evaluated on the client-side
#' @export
get_first_element <- function(property_name) {
  sprintf("d => d.%s[0]", property_name) %>% JS()
}

#' Create a data accessor retrieving the last element of an array
#'
#' @inheritParams get_first_element
#' @return JavaScript code evaluated on the client-side
#' @export
get_last_element <- function(property_name) {
  sprintf("d => d.%s.slice(-1)[0]", property_name) %>% JS()
}
