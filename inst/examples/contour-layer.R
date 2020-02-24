library(deckgl)

data_url <- paste0(
  "https://raw.githubusercontent.com/uber-common/deck.gl-data/",
  "master/examples/screen-grid/ca-transit-stops.json"
)

contours  <- list(
  use_contour_definition(
    threshold = 1,
    color = c(255, 0, 0),
    strokeWidth = 4
  ),
  use_contour_definition(
    threshold = 5,
    color = c(0, 255, 0),
    strokeWidth = 2
  ),
  use_contour_definition(
    threshold = c(6, 10),
    color = c(0, 0, 255, 128)
  )
)

deckgl(latitude = 35.6, longitude = -119.3, zoom = 6) %>%
  add_contour_layer(
    data = data_url,
    getPosition = JS("d => d"),
    opacity = 1,
    contours = contours
  ) %>%
  add_basemap()
