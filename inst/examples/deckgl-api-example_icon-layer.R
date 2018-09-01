sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

icon_atlas <- "https://deck.gl/images/icon-atlas.png"

icon_mapping <- list(
  marker = list(
    x = 0,
    y = 0,
    width = 128,
    height = 128,
    anchorY = 128,
    mask = TRUE
  )
)

properties <- list(
  pickable = TRUE,
  iconAtlas = icon_atlas,
  iconMapping = icon_mapping,
  sizeScale = 15,
  getPosition = get_position(coordinates = "coordinates"), # JS("d => d.coordinates"),
  getIcon = JS("d => 'marker'"),
  getSize = 5,
  getColor = JS("d => [Math.sqrt(d.exits), 140, 0]"),
  getTooltip = JS ("object => `${object.name}\n${object.address}`")
)

deckgl(pitch = 45) %>%
  add_icon_layer(data = sample_data, properties = properties) %>%
  # add_layer("IconLayer", "icon-layer", data = sample_data, properties = properties) %>%
  add_mapbox_basemap()
