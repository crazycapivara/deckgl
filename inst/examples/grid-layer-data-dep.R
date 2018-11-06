data <- system.file("sample-data/sf-bike-parking.json", package = "deckgl") %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  tibble::as.tibble()

properties <- list(
  pickable = TRUE,
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = get_position("lat", "lng")
)

# common way
deckgl() %>%
  add_grid_layer(data = data, properties = properties)

# external data file
deckgl() %>%
  add_data(data, "sfBikeParking") %>%
  add_grid_layer(data = get_data("sfBikeParking"), properties = properties)
