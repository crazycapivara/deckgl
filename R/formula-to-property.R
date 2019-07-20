formula_to_property <- function(properties) {
  for (key in names(properties)) {
    value <- properties[[key]]
    if (inherits(value, "formula")) {
      x <- all.vars(value)
      properties[[key]] <- list(dataAccessor = x)
      # if (length(x) > 1) {
      #   properties[[key]] <- sprintf("data => [%s]", paste0("data.", x, collapse = ", ")) %>%
      #     JS()
      # } else {
      #   properties[[key]] <- get_property(x[1])
      # }
    }
  }

  properties
}
