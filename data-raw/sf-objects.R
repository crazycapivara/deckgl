library(sf)
library(deckgl)

bart_stations_sf <- st_as_sf(bart_stations, coords = c("lng", "lat"), crs = 4326)

sf_bike_parking_sf <- st_as_sf(sf_bike_parking, coords = c("lng", "lat"), crs = 4326)

od_to_line <- function(x, from = c("from_lng", "from_lat"), to = c("to_lng", "to_lat")) {
  lines <- lapply(1:nrow(x), function(i) {
    x[i, c(from, to)] %>%
      as.numeric() %>%
      matrix(nrow = 2, byrow = TRUE) %>%
      st_linestring()
    }) %>% st_sfc(crs = 4326)
  st_sf(x, geometry = lines)
}

bart_segments_sf <- od_to_line(bart_segments)
