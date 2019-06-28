modify_sf <- function(data) {
  transform_this(data) %>%
    downcast()
}

transform_this <- function(data) {
  epsg <- sf::st_crs(data)$epsg
  if (!is.na(epsg) && epsg == 4326) {
    return(data)
  }

  sf::st_transform(data, 4326)
}

downcast <- function(data) {
  UseMethod("downcast", sf::st_geometry(data))
}

downcast.default <- function(data) {
  data
}

downcast.sfc_MULTIPOLYGON <- function(data) {
  cast_this(data, "POLYGON")
}

downcast.sfc_MULTIPOINT <- function(data) {
  cast_this(data, "POINT")
}

downcast.sfc_MULTILINESTRING <- function(data) {
  cast_this(data, "LINESTRING")
}

cast_this <- function(data, to) {
  suppressWarnings(sf::st_cast(data, to))
}

