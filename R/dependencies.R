deckgl_dependencies <- function() {
  list(
    htmltools::htmlDependency(
      "deckgl",
      version = "8.0.16",
      src = system.file("htmlwidgets/lib/deckgl", package = "deckgl"),
      script = c("dist.min.js"),
      stylesheet = "deckgl_.css",
      all_files = FALSE
    )
  )
}

#  - name: h3-js
#    version: 3.4.3
#    src: htmlwidgets/lib/h3
#    script: h3-js.umd.js
h3_dependencies <- function() {
  list(
    htmltools::htmlDependency(
      "h3-js",
      version = "3.4.3",
      src = system.file("htmlwidgets/lib/h3", package = "deckgl"),
      script = c("h3-js.umd.js"),
      all_files = FALSE
    )
  )
}
