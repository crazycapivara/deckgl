## see https://deck.gl/#/examples/core-layers/point-cloud-layer

## @knitr 3d-indoor-scan
library(deckgl)
library(rlas)
library(data.table)

# Fit point cloud in a 1x1x1 box centered at [0, 0, 0]
normalize_data <- function(data) {
  values_max <- apply(data, 2, max)
  values_min <- apply(data, 2, min)
  values_mid <- (values_max + values_min) / 2

  scale <- max(values_max - values_min)

  (sweep(data, 2, values_mid) / scale) %>%
    as.data.table()
}

data <- system.file("sample-data/indoor.0.1.laz", package = "deckgl") %>%
  read.las("xyz") %>%
  normalize_data()

properties <- list(
  coordinateSystem = JS("COORDINATE_SYSTEM.IDENTITY"),
  getPosition = ~X + Y + Z, # JS("d => [d.X, d.Y, d.Z]"),
  getNormal = c(0, 1, 0),
  getColor = c(255, 255, 255),
  pointSize = 0.5,
  opacity = 0.5
)

initial_view_state <- list(
  target = c(0, 0, 0),
  rotationX = 0,
  rotationOrbit = 0,
  orbitAxis = "Y",
  fov = 50,
  minZoom = 0,
  maxZoom = 20,
  zoom = 10
)

deck <- deckgl(
  initialViewState = initial_view_state,
  views = JS("new OrbitView()"),
  style = list(background = "black")
) %>%
  add_data(data) %>%
  add_point_cloud_layer(
    data = get_data(),
    properties = properties
  )

if (interactive()) deck
