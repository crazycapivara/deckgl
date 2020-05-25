# Example TextLayer
# -----
#get_bart_stations_url <- function() {
#  paste0(
#    "https://raw.githubusercontent.com/",
#    "uber-common/deck.gl-data/master/",
#    "website/bart-stations.json"
#  )
#}

#sample_text_properties <- function() {
#  list(
#    getPosition = JS("data => data.coordinates"),
#    getText = JS("data => data.name")
#  )
#}

#' Add a text layer to the deckgl widget
#'
#' The \code{TextLayer} renders text labels on the map using texture mapping.
#'
#' @inheritParams add_layer
#' @seealso \url{https://deck.gl/#/documentation/deckgl-api-reference/layers/text-layer}
#' @example inst/examples/deckgl-api-reference/text-layer.R
#' @export
add_text_layer <- function(deckgl, data = NULL, properties = list(), ..., id = "text-layer") {
  add_layer(deckgl, "TextLayer", data, properties, ..., id = id)
}
