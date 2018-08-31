sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/pointcloud.json"

properties <- list(
  pickable = TRUE,
  coordinateSystem = JS("COORDINATE_SYSTEM.METER_OFFSETS"),
  coordinateOrigin = c(-122.4, 37.74),
  radiusPixels = 4,
  getPosition = JS("d => d.position"),
  getNormal = JS("d => d.normal"),
  getColor = JS("d => d.color"),
  lightSettings =  list(),
  getTooltip = JS("object => object.position.join(', ')")
)

deckgl(pitch = 45, zoom = 11) %>%
  add_layer("PointCloudLayer", "point-cloud-layer", data = sample_data, properties = properties) %>%
  add_mapbox_basemap()
