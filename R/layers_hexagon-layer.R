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

#' Add a hexagon layer to the deckgl widget
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/hexagon-layer}
#'
#' @export
add_hexagon_layer <- function(deckgl, id = "hexagon-layer", data = NULL, properties = list(), ...) {
  # use sample data if no data is given
  if (is.null(data)) {
    data <- sf_bike_parking
    properties <- properties_hexagon_layer
  }

  add_layer(deckgl, "HexagonLayer", id, data, properties, ...)
}
