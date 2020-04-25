invoke_method <- function(widget, func_name, ...) {
  pos <- length(widget$x$calls) + 1
  widget$x$calls[[pos]] <- list(funcName = func_name, args = list(...))
  widget
}

#push_to_prop <- function(widget, prop, ...) {
#  pos <- length(widget$x[[prop]]) + 1
#  widget$x[[prop]][[pos]] <- list(...)
#  widget
#}
