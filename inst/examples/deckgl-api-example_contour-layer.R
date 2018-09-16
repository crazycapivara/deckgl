sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

contours <- list(
  contour_definition(
    threshold = 1,
    color = c(255, 0, 0),
    strokeWidth = 1
  ),
  contour_definition(
    threshold = 5,
    color = c(0, 255, 0),
    strokeWidth = 3
  ),
  contour_definition(
    threshold = 15,
    color = c(0, 0, 255),
    strokeWidth = 4
  )
)

contour_properties <- list(
  contours = contours,
  cellSize = 200,
  elevationScale = 4,
  getPosition = get_position(coordinates = "COORDINATES")
)

deckgl() %>%
  add_contour_layer(data = sample_data, properties = contour_properties) %>%
  add_mapbox_basemap()
