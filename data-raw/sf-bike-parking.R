library(jsonlite)

source("data-raw/parse-to-tibble.R")

filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

sf_bike_parking <- read_json(filename) %>%
  parse_to_tibble(coordinates = "COORDINATES")

names(sf_bike_parking) %<>% tolower()

# test data
deckgl() %>%
  add_grid_layer(
    data = sf_bike_parking,
    getPosition = get_position(latitude = "lat", longitude = "lng"),
    pickable = TRUE,
    extruded = TRUE,
    cellSize = 200,
    elevationScale = 4,
    getTooltip = JS("object => `${object.count}`")
  )
