# Example HexagonLayer
# -----
sf_bike_parking <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

properties_hexagon_layer <- list(
  pickable = TRUE,
  extruded = TRUE,
  radius = 200,
  elevationScale =4,
  getPosition = htmlwidgets::JS("data => data.COORDINATES")
)

#' @export
add_hexagon_layer <- function(deckgl, id = "hexagon-layer", data = NULL, ...) {
  properties <- list(...)
  # if no data is given use sample data
  if (is.null(data)) {
    data <- sf_bike_parking
    properties <- properties_hexagon_layer
  }
  add_layer(deckgl, "HexagonLayer", id, data, properties)
}
