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
#' @param source  The ID of the data source ...
#' @return A deckgl widget object.
#' @export
add_layer <- function(deckgl, class_name, id, data = NULL, properties = list(), ..., tooltip = NULL, source = NULL) {
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

  if (inherits(data, "sf")) {
    data <- modify_sf(data)
  }

  deckgl %>% invoke_method(
    "addLayer",
    className = class_name,
    convertData = inherits(data, "data.frame"),
    data = data,
    source = source,
    properties = utils::modifyList(
      list(id = id),
      formula_to_property(properties)
    )
  )

  #layer <- list(
  #  className = class_name,
  #  convertData = inherits(data, "data.frame"),
  #  data = data,
  #  source = source,
  #  properties = utils::modifyList(
  #    # list(id = id, data = data),
  #    list(id = id),
  #    formula_to_property(properties)
  #  )
  #)
  #deckgl$x$layers %<>%
  #  push(layer)
  #deckgl
}

#has_source <- function(deckgl, source_id) {
#  n <- length(deckgl$x$sources)
#  if (n == 0) return(FALSE)

#  source_id %in% sapply(1:n, function(i) deckgl$x$sources[[i]]$id)
#}

# Deprecated
# TODO: Remove in next release
#merge_properties <- function(x, y) {
#  .Deprecated("modifyList")

#  for (name in names(y)) {
#    x[[name]] <- y[[name]]
#  }
#  x
#}
