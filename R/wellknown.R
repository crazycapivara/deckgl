use_wellknown <- function(env = parent.frame(), key = "getPosition") {
  if (!identical(env, globalenv())) {
    env$data <- wellknown(env$data)
    env$properties[[key]] <- get_wellknown()
  }
}

cast_this <- function(data, to) {
  suppressWarnings(sf::st_cast(data, to)) %>%
    wellknown()
}

#' Parse geometry column of \code{sf} object to wellknown text
#'
#' @param data object of class \code{sf}
#'
#' @seealso \code{\link{get_wellknown}}
#'
#' @name wellknown
#' @export
wellknown <- function(data) {
  UseMethod("wellknown", sf::st_geometry(data))
}

#' @name wellknown
#' @export
wellknown.sfc_MULTIPOLYGON <- function(data) {
  cast_this(data, "POLYGON")
  # suppressWarnings(sf::st_cast(data, "POLYGON")) %>%
  #   wellknown()
}

#' @name wellknown
#' @export
wellknown.sfc_MULTILINESTRING <- function(data) {
  cast_this(data, "LINESTRING")
  # suppressWarnings(sf::st_cast(data, "LINESTRING")) %>%
  #   wellknown()
}

#' @name wellknown
#' @export
wellknown.sfc_MULTIPOINT <- function(data) {
  cast_this(data, "POINT")
}

#' @name wellknown
#' @export
wellknown.default <- function(data) {
  data$geom_wkt <- sf::st_geometry(data) %>%
    sf::st_as_text()
  sf::st_geometry(data) <- NULL
  data
}

#' Create a data accessor getting coordinates from wellknown text
#'
#' Used in conjunction with \code{\link{wellknown}}.
#'
#' @export
get_wellknown <- function() {
  JS("data => wellknown.parse(data.geom_wkt).coordinates")
}

#' @describeIn get_wellknown Get the first point from a \code{LINESTRING}
#' @export
get_wellknown_origin <- function() {
  JS("data => wellknown.parse(data.geom_wkt).coordinates[0]")
}

#' @describeIn get_wellknown Get the last point from a \code{LINESTRING}
#' @export
get_wellknown_destination <- function() {
  JS("data => wellknown.parse(data.geom_wkt).coordinates.slice(-1)[0]")
}
