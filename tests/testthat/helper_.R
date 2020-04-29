# helper functions needed for tests
# -----
properties_ <- function(deckgl) {
  deckgl$x$layers[[1]]$properties
}

get_layer_props <- function(widget, idx = 1) {
  widget$x$calls[[idx]]$args$properties
}
