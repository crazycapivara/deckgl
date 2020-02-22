#' Check if everything works fine
#'
#' @inheritParams add_mapbox_basemap
#'
#' @export
does_it_work <- function(token = NULL) {
  it_works <- data.frame(lat = 37.8, lng = -122.45, text = "it works")
  deck <- deckgl() %>%
    add_text_layer(data = it_works, getPosition = JS("data => [data.lng, data.lat]"))
  if (is.null(token)) {
    return(deck)
  }

  deck %>%
    add_mapbox_basemap(token = token)
}
