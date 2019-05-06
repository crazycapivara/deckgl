#' Add raster tiles layer to the deckgl widget
#' @inheritParams add_layer
#' @param tileServer base url of the tile server
#' @export
add_raster_tiles <- function(
  deckgl,
  id = "raster-tiles",
  tileServer = "https://a.tile.openstreetmap.org/",
  properties = list(),
  ...) {
  properties <- utils::modifyList(raster_tiles_properties(tileServer), properties)
  add_layer(deckgl, "TileLayer", id, data = NULL, properties = properties, ...)
}

raster_tiles_properties <- function(tile_server) {
  list(
    opacity = 1,
    minZoom = 0,
    maxZoom = 19,
    tileServer = tile_server,
    renderSubLayers = JS("deckglWidget.renderMapTiles")
  )
}
