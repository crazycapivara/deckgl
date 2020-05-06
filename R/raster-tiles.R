### TODO: Remove in next version
###
#' Add a raster tile layer to the deckgl widget
#'
#' EXPERIMENTAL, see \url{https://deck.gl/#/examples/core-layers/tile-layer}
#'
#' @inheritParams add_layer
#' @param tileServer base url of the tile server
#' @example inst/examples/deckgl-api-reference/raster-tile-layer.R
#' @export
add_raster_tile_layer <- function(
  deckgl,
  id = "raster-tiles",
  tileServer = "https://c.tile.openstreetmap.org/",
  properties = list(),
  ...
) {
  properties <- utils::modifyList(raster_tile_properties(tileServer), properties)
  add_layer(deckgl, "TileLayer", id, data = NULL, properties = properties, ...)
}

raster_tile_properties <- function(tile_server) {
  list(
    opacity = 1,
    minZoom = 0,
    maxZoom = 19,
    tileServer = tile_server,
    renderSubLayers = JS("deckglWidget.renderMapTiles")
  )
}
