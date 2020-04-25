to_camel_case <- function(x) {
  gsub("_(\\w?)", "\\U\\1", x, perl = TRUE)
}

keys_to_camel_case <- function(x) {
  stats::setNames(x, to_camel_case(names(x)))
}

compact <- function(x) {
  x[!sapply(x, is.null)]
}

# Append a list (y) to a list of lists (x)
push <- function(x, y) {
  c(x, list(y))
}
