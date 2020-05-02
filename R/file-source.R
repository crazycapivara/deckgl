create_file_source <- function(id, data) {
  if (inherits(data, "df")) data <- modify_sf(data)
  src <- tempdir()
  filename <- paste0(id, ".js")
  source <- list(id = id, data = data) %>%
    jsonlite::toJSON(auto_unbox = TRUE, force = TRUE)
  paste0("_deckWidget.sources.push(", source, ");") %>%
    readr::write_file(file.path(src, filename))
  list(
    htmltools::htmlDependency(
      paste0("data-", id),
      version = "42",
      src = src,
      script = filename,
      all_files = FALSE
    )
  )
}

#' Add source as JavaScript dep
#'
#' @inheritParams add_source
#' @export
add_source_as_dep <- function(deckgl, id, data) {
  deckgl$dependencies %<>% c(create_file_source(id, data))
  deckgl
}
