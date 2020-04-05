invoke_method <- function(widget, func_name, ...) {
  pos <- length(widget$x$calls) + 1
  widget$x$calls[[pos]] <- list(funcName = func_name, args = list(...))
  widget
}
