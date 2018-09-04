library(jsonlite)

source("data-raw/parse-to-tibble.R")

filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-segments.json"

x <- read_json(filename)
from <- lapply(x, "[[", "from")
to <- lapply(x, "[[", "to")

from_coords <- get_coords(from)
from_cols <- get_columns(from)

to_coords <-  get_coords(to)
to_cols <- get_columns(to)

bart_segments <- tibble(from_name = from_cols$name, from_lat = from_coords$lat, from_lng = from_coords$lng,
                        to_name = to_cols$name, to_lat = to_coords$lat, to_lng = to_coords$lng,
                        inbound = sapply(x, "[[", "inbound"), outbound = sapply(x, "[[", "outbound")
)
