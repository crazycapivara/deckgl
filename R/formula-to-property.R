EXPRESSION_IDENTIFIER <- "@="

# TODO: Rename to 'convert_formulas'
formula_to_property <- function(properties) {
  for (key in names(properties)) {
    value <- properties[[key]]
    if (inherits(value, "formula")) {
      x <- all.vars(value)
      if (length(x) > 1) {
        properties[[key]] <- paste0(x, collapse = ", ") %>%
          paste0(EXPRESSION_IDENTIFIER,"[", ., "]")
        #properties[[key]] <- sprintf("data => [%s]", paste0("data.", x, collapse = ", ")) %>%
        #  JS()
      } else {
        properties[[key]] <- paste0(EXPRESSION_IDENTIFIER, x[1]) #get_property(x[1])
      }
    }
  }

  properties
}
