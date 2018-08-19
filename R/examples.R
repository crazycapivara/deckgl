#' @export
does_it_work <- function() {
  it_works <- data.frame(lat = 37.8, lng = -122.45, text = "it works")
  deckgl() %>%
    add_text_layer(data = it_works, getPosition = JS("data => [data.lng, data.lat]"))
}
