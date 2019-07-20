to_camel_case <- function(x) {
  gsub("_(\\w?)", "\\U\\1", x, perl = TRUE)
}

keys_to_camel_case <- function(x) {
  # names(x) <- names(x) %>% to_camel_case()
  # x
  stats::setNames(x, to_camel_case(names(x)))
}
