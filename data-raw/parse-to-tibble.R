library(tibble)

# get coordinates
get_coords <- function(data, coordinates = "coordinates") {
  lapply(data, function(x) {
    coords <- x[[coordinates]]
    c(lng = coords[[1]], lat = coords[[2]])
  }) %>% do.call(rbind, .) %>% as.tibble()
}

# get columns
get_columns <- function(data, coordinates = "coordinates") {
  names_ <- names(data[[1]])
  names_ <- names_[names_ != coordinates]
  out <- lapply(names_, function(name) {
    sapply(data, "[[", name)
  })
  names(out) <- names_
  out %>% as_tibble()
}

parse_to_tibble <- function(data, ...) {
  coords <- get_coords(data, ...)
  data <- get_columns(data, ...)
  data$lng <- coords$lng
  data$lat <- coords$lat
  data
}
