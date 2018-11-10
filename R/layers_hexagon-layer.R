# Example HexagonLayer
# -----
get_sf_bike_parking_url <- function() {
  paste0(
    "https://raw.githubusercontent.com/",
    "uber-common/deck.gl-data/master/",
    "website/sf-bike-parking.json"
  )
}

sample_hexagon_properties <- function() {
  list(
    pickable = TRUE,
    extruded = TRUE,
    radius = 200,
    elevationScale = 4,
    getPosition = JS("data => data.COORDINATES")
  )
}

#' Add a hexagon layer to the deckgl widget
#'
#' The \code{HexagonLayer} renders a hexagon heatmap based on an array of points. It takes the radius of hexagon bin, projects points into hexagon bins.
#' The color and height of the hexagon is scaled by number of points it contains.
#'
#' @inheritParams add_layer
#'
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/hexagon-layer}
#'
#' @example inst/examples/deckgl-api-reference/hexagon-layer.R
#'
#' @export
add_hexagon_layer <- function(deckgl, id = "hexagon-layer", data = NULL, properties = list(), ...) {
  # use sample data if no data is given
  if (is.null(data)) {
    data <- get_sf_bike_parking_url()
    properties <- sample_hexagon_properties()
  }

  add_layer(deckgl, "HexagonLayer", id, data, properties, ...)
}
