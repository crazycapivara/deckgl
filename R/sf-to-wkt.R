#' @name wellknown
#' @export
wellknown <- function(data) {
  UseMethod("wellknown", sf::st_geometry(data))
}

#' @name wellknown
#' @export
wellknown.sfc_MULTIPOLYGON <- function(data) {
  suppressWarnings(sf::st_cast(data, "POLYGON")) %>%
    wellknown()
}

#' @name wellknown
#' @export
wellknown.sfc_MULTILINESTRING <- function(data) {
  suppressWarnings(sf::st_cast(data, "LINESTRING")) %>%
    wellknown()
}

#' @name wellknown
#' @export
wellknown.default <- function(data) {
  data$geom_wkt <- sf::st_geometry(data) %>%
    sf::st_as_text()
  sf::st_geometry(data) <- NULL
  data
}

wellknown_ <- function(data) {
  geometry_class <- sf::st_geometry(data) %>% class()
  #if ("sfc_MULTIPOLYGON" %in% geometry_class) {
  #  suppressWarnings(data <- sf::st_cast(data, "POLYGON"))
  #}

  #if ("sfc_MULTILINESTRING" %in% geometry_class) {
  #  suppressWarnings(data <- sf::st_cast(data, "LINESTRING"))
  #}

  data$geom_wkt <- sf::st_geometry(data) %>%
    sf::st_as_text()
  sf::st_geometry(data) <- NULL
  data
}

#' @export
get_wellknown <- function() {
  JS("data => wellknown.parse(data.geom_wkt).coordinates")
}
