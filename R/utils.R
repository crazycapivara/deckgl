to_camel_case <- function(x) {
  gsub("_(\\w?)", "\\U\\1", x, perl = TRUE)
}

keys_to_camel_case <- function(x) {
  stats::setNames(x, to_camel_case(names(x)))
}

compact <- function(x) {
  x[!sapply(x, is.null)]
}

get_center <- function(x) {
  suppressWarnings(
    lnglat <- sf::st_bbox(x) %>%
      sf::st_as_sfc() %>%
      sf::st_centroid() %>%
      sf::st_coordinates()
  )
  list(
    lng = lnglat[, "X"],
    lat = lnglat[, "Y"]
  )
}
