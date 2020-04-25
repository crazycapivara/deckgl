## @knitr screen-grid-layer
data("sf_bike_parking")

properties <- list(
  opacity = 0.8,
  cellSizePixels = 50,
  colorRange = RColorBrewer::brewer.pal(6, "Blues"),
  getPosition = ~lng + lat,
  getWeight = ~spaces
)

deck <- deckgl() %>%
  add_screen_grid_layer(data = sf_bike_parking, properties = properties) %>%
  add_basemap() %>%
  add_control("Screen Grid Layer")

if (interactive()) deck
