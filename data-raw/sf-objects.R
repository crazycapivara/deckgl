library(sf)
library(deckgl)

bart_stations_sf <- st_as_sf(bart_stations, coords = c("lng", "lat"), crs = 4326)

sf_bike_parking_sf <- st_as_sf(sf_bike_parking, coords = c("lng", "lat"), crs = 4326)
