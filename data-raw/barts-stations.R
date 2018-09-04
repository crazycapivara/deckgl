library(magrittr)
library(jsonlite)

source("data-raw/parse-to-tibble.R")

filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

bart_stations <- read_json(filename, flatten = TRUE) %>%
  parse_to_tibble()

bart_stations$entries %<>% as.numeric()
bart_stations$exits %<>% as.numeric()

# test data
deckgl() %>%
  add_text_layer(
    data = bart_stations,
    getText = JS("d => d.name"),
    getPosition = get_position(latitude = "lat", longitude = "lng")
    # getPosition = get_position(coordinates = "coordinates")
  )

deckgl() %>%
  add_text_layer(
    data = filename,
    getText = JS("d => d.name"),
    getPosition = get_position(coordinates = "coordinates")
  )
