default_deckgl_properties <- list(
  longitude = -122.45,
  latitude = 37.8,
  zoom = 12,
  mapboxApiAccessToken = "",
  mapStyle = ""
)

#' @export
deckgl <- function(width = NULL, height = NULL, element_id = NULL, properties = list(), ...) {
  widget_data <- list(
    deckGLProperties = utils::modifyList(
      default_deckgl_properties,
      list(...)
    ),
    layers = list(),
    layerDefs = list()
  )

  htmlwidgets::createWidget(
    name = "deckgl",
    x = widget_data,
    width = width,
    height = height,
    package = "deckgl",
    elementId = element_id,
    dependencies = c(deckgl_dependencies(), mapboxgl_dependencies())
  )
}

append_layer <- function(widget, class_name, id, data, properties) {
  n <- length(widget$x$layerDefs)
  widget$x$layerDefs[[n + 1]] <- list(
    className = class_name,
    properties = c(
      list(
        id = id,
        data = data,
        df = inherits(data, "data.frame")
      ),
      formula_to_property(properties)
    )
  )
  widget
}
