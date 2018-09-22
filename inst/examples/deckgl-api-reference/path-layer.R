sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/master/",
  "website/bart-lines.json"
)

properties <- list(
  pickable = TRUE,
  widthScale = 20,
  widthMinPixels = 2,
  getPath = get_value("path"),
  # getColor = JS("d => deckglWidget.colorToRGBArray(d.color)"),
  getColor = get_color_to_rgb_array("color"),
  getWidth = 5,
  getTooltip = get_value("name")
)

deckgl(pitch = 25) %>%
  add_path_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()
