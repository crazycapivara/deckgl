mapboxgl_dependencies <- function() {
  list(
    htmltools::htmlDependency(
      "mapbox-gl",
      version = "0.48.0",
      src = system.file("htmlwidgets/lib/mapboxgl", package = "deckgl"),
      script = c("mapbox-gl.js"),
      stylesheet = "mapbox-gl.css",
      all_files = FALSE
    )
  )
}
