#' Add any kind of layer to the deckgl widget
#'
#' Generic function to add any kind of layer to the deckgl widget.
#' Usually you will not use this one but any of the \code{add_*_layer} functions instead.
#'
#' @param deckgl A deckgl widget object.
#' @param class_name The name of the JavaScript layer class, e. g. \code{ScatterplotLayer}.
#' @param id The unique id of the layer.
#' @param data The url to fetch data from or a data object.
#' @param properties A named list of properties with names corresponding to the properties defined
#'   in the \href{https://deck.gl/#/documentation/deckgl-api-reference}{deckgl-api-reference}
#'   for the given layer class.
#' @param ... More properties that will be added to the \code{properties} object. This can be useful
#'   if you want to use a properties object for more than one layer.
#' @param tooltip A tooltip template that defines what should be displayed when the mouse enters an object.
#'   You can also pass a list with the properties \code{html} and \code{style}. See also \code{\link{use_tooltip}}.
#' @return A deckgl widget object.
#' @export
add_layer <- function(deckgl, class_name, id, data, properties = list(), ..., tooltip = NULL) {
  properties <- list(tooltip = tooltip) %>%
    utils::modifyList(properties) %>%
    utils::modifyList(list(...)) %>%
    compact() %>%
    keys_to_camel_case()
  #if (!is.null(properties$getTooltip)) .Deprecated("tooltip", old = "getTooltip")

  if (any(c("tooltip", "getTooltip", "autoHighlight") %in% names(properties)) &&
        is.null(properties$pickable)) {
    properties$pickable <- TRUE
  }

  #if (inherits(data, "sf")) {
  #  data <- modify_sf(data)
  #}

  #source_id <- paste0("data-", id)

  #source <- list(
  #  id = source_id,
  #  df = inherits(data, "data.frame"),
  #  data = data
  #)

  #if (is.character(data) & deckgl %>% has_source(data)) {
  #  source_id <- data
  #}
  #else {
  #  source_id <- paste0("data-", id)
  #  deckgl$x$sources %<>%
  #    push(create_source(source_id, data))
  #}


  # TODO: Use 'push' as above
  n <- length(deckgl$x$layers)
  deckgl$x$layers[[n + 1]] <- list(
    className = class_name,
    source = create_source(data),
    properties = c(
      id = id,
      formula_to_property(properties)
    )
  )
  deckgl
}

has_source <- function(deckgl, source_id) {
  n <- length(deckgl$x$sources)
  if (n == 0) return(FALSE)

  source_id %in% sapply(1:n, function(i) deckgl$x$sources[[i]]$id)
}

# Deprecated
# TODO: Remove in next release
#merge_properties <- function(x, y) {
#  .Deprecated("modifyList")

#  for (name in names(y)) {
#    x[[name]] <- y[[name]]
#  }
#  x
#}
