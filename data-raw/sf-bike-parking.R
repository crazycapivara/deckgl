source("data-raw/_tidy_up.R")

filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

sf_bike_parking <- read_json(filename, simplifyVector = TRUE) %>%
  as.tibble() %>%
  unnest_coords(coordinates = "COORDINATES")
names(sf_bike_parking) %<>% tolower()

write_json(sf_bike_parking, "inst/sample-data/sf-bike-parking.json")

# --------------- test dataset
deckgl(zoom = 11, pitch = 45) %>%
  add_grid_layer(
    data = sf_bike_parking,
    extruded = TRUE,
    cellSize = 200,
    elevationScale = 4,
    getPosition = get_position("lat", "lng")
  ) %>%
  add_mapbox_basemap()
