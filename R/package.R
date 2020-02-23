deckgljs_version <- function() {
  use_deps("deck.gl")$deck.gl$version
}

browse_api_examples <- function() {
  system.file("examples/deckgl-api-reference", package = "deckgl") %>%
    list.files()
}

run_api_example <- function(script_name = "arc-layer.R") {
  system.file("examples/deckgl-api-reference", package = "deckgl") %>%
    paste0("/", script_name) %>%
    source()
}
