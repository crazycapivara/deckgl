library(jsonlite)
library(tibble)

# get coordinates
get_coords <- function(data) {
  lapply(data, function(x) {
    c(lng = x$coordinates[[1]], lat = x$coordinates[[2]])
  }) %>% do.call(rbind, .) %>% as.tibble()
}

# get columns
get_columns <- function(data) {
  names_ <- names(data[[1]])
  names_ <- names_[names_ != "coordinates"]
  out <- lapply(names_, function(name) {
    sapply(data, "[[", name)
  })
  names(out) <- names_
  out %>% as_tibble()
}

parse_to_tibble <- function(data) {
  coords <- get_coords(data)
  data <- get_columns(data)
  data$lng <- coords$lng
  data$lat <- coords$lat
  data
}

# parse data
filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

bart_stations <- read_json(filename, flatten = TRUE) %>%
  parse_to_tibble

bart_stations$entries %<>% as.numeric()
bart_stations$exits %<>% as.numeric()

# test data
deckgl() %>%
  add_text_layer(data = bart_stations,
                 getText = JS("d => d.name"),
                 #getPosition = get_position(latitude = "lat", longitude = "lng")
                 getPosition = get_position(coordinates = "coordinates")
                 )

deckgl() %>%
  add_text_layer(data = filename,
                 getText = JS("d => d.name"),
                 getPosition = get_position(coordinates = "coordinates"))
