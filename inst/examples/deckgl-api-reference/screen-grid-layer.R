## @knitr screen-grid-layer
sample_data <- paste0(
  "https://raw.githubusercontent.com/uber-common/",
  "deck.gl-data/master/",
  "website/sf-bike-parking.json"
)

properties <- list(
  pickable = FALSE,
  opacity = 0.8,
  cellSizePixels = 50,
  minColor = c(0, 0, 0, 0),
  maxColor = c(0, 180, 0, 255),
  getPosition = get_property("COORDINATES"),
  getWeight = get_property("SPACES")
)

deck <- deckgl() %>%
  add_screen_grid_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
