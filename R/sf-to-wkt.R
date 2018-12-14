#' @export
wellknown <- function(data) {
  geometry_class <- st_geometry(data) %>% class()
  if ("sfc_MULTIPOLYGON" %in% geometry_class){
    suppressWarnings(data <- sf::st_cast(data, "POLYGON"))
  }

  data$geom_wkt <- sf::st_geometry(data) %>%
    st_as_text()
  sf::st_geometry(data) <- NULL
  data
}

#' @export
get_wellknown <- function() {
  JS("data => wellknown.parse(data.geom_wkt).coordinates")
}
