source("data-raw/_tidy_up.R")

filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

bart_stations <- read_json(filename, simplifyVector = TRUE) %>%
  as.tibble() %>%
  unnest_coords()
bart_stations[c("entries", "exits")] %<>% lapply(as.numeric)

write_json(bart_stations, "inst/sample-data/bart-stations.json")

# --------------- test dataset
deckgl() %>%
  add_text_layer(
    data = bart_stations,
    getPosition = get_position("lat", "lng"),
    getText = JS("d => d.name")
  ) %>%
  add_mapbox_basemap()
