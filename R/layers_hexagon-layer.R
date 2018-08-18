# Example HexagonLayer
# -----
sf_bike_parking <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

properties_hexagon_layer <- list(
  pickable = TRUE,
  extruded = TRUE,
  radius = 200,
  elevationScale = 4,
  getPosition = JS("data => data.COORDINATES")
)

#' @export
add_hexagon_layer <- function(deckgl, id = "hexagon-layer", data = NULL, properties = list(), ...) {
  properties <- c(properties, ...)
  # use sample data if no data is given
  if (is.null(data)) {
    data <- sf_bike_parking
    properties <- properties_hexagon_layer
  }

  add_layer(deckgl, "HexagonLayer", id, data, properties)
}
