library(magrittr)
library(jsonlite)
library(tibble)

coords <- function(x, coordinates = "coordinates") {
  lapply(x[[coordinates]], function(x) {
    c(lng = x[1], lat = x[2])
  }) %>%
    do.call(rbind, .)
}

unnest_coords <- function(data, coordinates = "coordinates") {
  data[c("lng", "lat")] <- coords(data, coordinates = coordinates)
  data[coordinates] <- NULL
  data
}
