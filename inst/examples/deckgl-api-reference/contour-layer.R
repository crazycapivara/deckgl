## @knitr contour-layer
sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/sf-bike-parking.json"
)

contours <- list(
  contour_definition(
    threshold = 1,
    color = c(255, 0, 0),
    strokeWidth = 2
  ),
  contour_definition(
    threshold = 5,
    color = c(0, 255, 0),
    strokeWidth = 3
  ),
  contour_definition(
    threshold = 15,
    color = c(0, 0, 255),
    strokeWidth = 5
  )
)

properties <- list(
  contours = contours,
  cellSize = 200,
  elevationScale = 4,
  getPosition = get_property("COORDINATES")
)

deck <- deckgl(zoom = 10.5, pitch = 30) %>%
  add_contour_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
