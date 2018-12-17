library(sf)
library(deckgl)

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/highway/roads.json"
)

roads <- st_read(data_url, quiet = TRUE)

initial_view_state <- list(
  latitude = 38,
  longitude = -100,
  zoom = 4,
  minZoom = 2,
  maxZoom = 8
)

deck <- deckgl(initialViewState = initial_view_state) %>%
  add_path_layer(
    data = wellknown(roads),
    getPath = get_wellknown(),
    widthScale = 20,
    widthMinPixels = 2
  )

# Parsing 'sf' object automatically
deck <- deckgl(initialViewState = initial_view_state) %>%
  add_path_layer(
    data = roads,
    widthScale = 20,
    widthMinPixels = 2
  )

if (interactive()) deck
