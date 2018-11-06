deckgljs_version <- function() {
  filename <- system.file("htmlwidgets/deckgl.yaml", package = "deckgl")
  yaml::yaml.load_file(filename)$dependencies[[1]]$version
}
