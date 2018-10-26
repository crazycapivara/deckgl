## @knitr point-cloud-layer
sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/pointcloud.json"
)

properties <- list(
  pickable = TRUE,
  coordinateSystem = JS("COORDINATE_SYSTEM.METER_OFFSETS"),
  coordinateOrigin = c(-122.4, 37.74),
  radiusPixels = 4,
  getPosition = get_property("position"),
  getNormal = get_property("normal"),
  getColor = get_property("color"),
  lightSettings = list(),
  getTooltip = JS("object => object.position.join(', ')")
)

deck <- deckgl(pitch = 45, zoom = 10.5) %>%
  add_point_cloud_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
