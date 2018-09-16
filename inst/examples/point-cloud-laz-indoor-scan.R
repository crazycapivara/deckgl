#' see https://deck.gl/#/examples/core-layers/point-cloud-layer

library(magrittr)
library(rlas)
library(data.table)

#' Prepare data

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
  rlas::read.las("xyz") %>%
  normalize_data()

#' Create deckgl widget

properties <- list(
  coordinateSystem = JS("COORDINATE_SYSTEM.IDENTITY"),
  getPosition = JS("d => [d.X, d.Y, d.Z]"),
  getNormal = c(0, 1, 0),
  getColor = c(255, 255, 255),
  radiusPixels = 0.5
)

initial_view_state <- list(
  lookAt = c(0, 0, 0),
  distance = JS("OrbitView.getDistance({boundingBox: [1, 1, 1], fov: 30})"),
  rotationX = 0,
  rotationOrbit = 0,
  orbitAxis = "Y",
  fov = 30,
  minDistance = 0.5,
  maxDistance = 3,
  zoom = 1
)

deckgl(initialViewState = initial_view_state, views = JS("new OrbitView()")) %>%
  add_point_cloud_layer(data = data, properties = properties) %>%
  htmlwidgets::onRender("() => deckglWidget.element.style.background = 'black'")
