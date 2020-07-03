#' Set the view state of the map
#' @inheritParams add_layer
#' @param latitude The latitude of the view state.
#' @param longitude The longitude of the view state.
#' @param zoom The zoom level of the view state.
#' @param pitch The pitch of the view state.
#' @param bearing The bearing of the view state.
#' @export
set_view_state <- function(deckgl, latitude = 37.8, longitude = -122.45,
                           zoom = 12, pitch = 0, bearing = 0) {

  deckgl %>%
    invoke_method(
      "setViewState",
      latitude = latitude,
      longitude = longitude,
      zoom = zoom,
      pitch = pitch,
      bearing = bearing
    )
}
