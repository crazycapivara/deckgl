use_pal_numeric <- function(pal) {
  e <- environment(pal)
  values <- unique(e$domain) %>% sort()
  list( colors = pal(values), labels = values )
}

use_pal_bin <- function(pal) {
  e <- environment(pal)
  values <- e$bins
  list( colors = unique(pal(e$bins)), labels = create_labels(values) )
}

use_pal_quantile <- function(pal) {
  e <- environment(pal)
  values <- attributes(pal)$colorArgs$probs * 100
  list( colors = unique(pal(e$bins)), labels = create_labels(values) )
}

create_labels <- function(x) {
  sapply(1:(length(x) - 1), function(i) paste(x[i], "-", x[i + 1]))
}

use_pal <- function(pal) {
  type <- paste0("col_", attributes(pal)$colorType)
  pal <- structure(pal, class = c(class(pal), type))
  UseMethod("use_pal", pal)
}

use_pal.col_numeric <- use_pal_numeric
use_pal.col_bin <- use_pal_bin
use_pal.col_quantile <- use_pal_quantile
use_pal.col_factor <- use_pal_numeric

#' Add a legend to the deckgl widget using a palette func
#'
#' @inheritParams add_legend
#' @param pal A palette function that is used to create the
#'   legend elements (colors and labels) automatically.
#' @param ... Parameters that are passed to \code{\link{add_legend}}.
#' @seealso \code{\link[scales]{col_numeric}} et cetera for how to create a palette function.
#' @export
add_legend_pal <- function(deckgl, pal, ...) {
  items <- use_pal(pal)
  add_legend(deckgl, colors = items$colors, labels = items$labels, ...)
}
