## experimental

data_dependency <- function(data, var_name) {
  src <- tempdir()
  filename <- tolower(var_name) %>% paste0(".js")
  paste0("var ", var_name, "=", jsonlite::toJSON(data, auto_unbox = TRUE)) %>%
    readr::write_file(file.path(src, filename))
  list(
    htmltools::htmlDependency(
      paste0("data-", tolower(var_name)),
      version = "42",
      src = src,
      script = filename,
      all_files = FALSE
    )
  )
}

#' Add JavaScript data file
#'
#' EXPERIMENTAL
#'
#' @param deckgl deckgl widget
#' @param data data object
#' @param var_name JavaScript variable name used to make the data available
#'
#' @example inst/examples/deckgl-api-reference/grid-layer-data-dependency.R
#'
#' @export
add_data <- function(deckgl, data, var_name = "thanksForAllTheFish") {
  deckgl$dependencies <- c(
    deckgl$dependencies,
    data_dependency(data, var_name)
  )
  deckgl
}

#' Get data
#'
#' EXPERIMENTAL, usually used in conjunction with \link{add_data}
#'
#' @param var_name JavaScript variable name
#'
#' @export
get_data <- function(var_name = "thanksForAllTheFish") {
  JS(var_name)
}
