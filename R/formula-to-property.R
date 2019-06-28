formula_to_property <- function(properties) {
  for (key in names(properties)) {
    value <- properties[[key]]
    if (inherits(value, "formula")) {
      x <- all.vars(value)
      if (length(x) > 1) {
        properties[[key]] <- sprintf("data => [%s]", paste0("data.", x, collapse = ", ")) %>%
          JS()
      } else {
        properties[[key]] <- get_property(x[1])
      }
    }
  }

  properties
}
