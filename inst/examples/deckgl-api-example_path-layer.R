sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-lines.json"

properties <- list(
  pickable = TRUE,
  widthScale = 20,
  widthMinPixels = 2,
  getPath = JS("d => d.path"),
  # getColor = c(255, 140, 20),
  getColor = JS("d => deckglWidget.colorToRGBArray(d.color)"),
  getWidth = 5,
  getTooltip = JS("object => object.name")
)

deckgl(pitch = 25) %>%
  add_path_layer(data = sample_data, properties = properties) %>%
  # add_layer("PathLayer", "path-layer", data = sample_data, properties = properties) %>%
  add_mapbox_basemap()
