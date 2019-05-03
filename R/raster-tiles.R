#' Add raster tiles layer to the deckgl widget
#' @inheritParams add_layer
#' @export
add_raster_tiles <- function(deckgl, id = "raster-tiles", ...) {
  # properties <- modifyList(raster_tiles_properties(), list(...))
  add_layer(deckgl, "TileLayer", id, data = NULL, properties = raster_tiles_properties(), ...)
}

raster_tiles_properties <- function() {
  list(
    opacity = 1,
    minZoom = 0,
    maxZoom = 19,
    tms = "https://a.tile.openstreetmap.org/",
    renderSubLayers = JS("deckglWidget.renderMapTiles")
  )
}
