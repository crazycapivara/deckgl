bart_stations <- system.file("sample-data/bart-stations.json", package = "deckgl") %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  tibble::as.tibble()

main_properties <- list(
  getPosition = get_position("lat", "lng")
)

deckgl(zoom = 10, pitch = 35) %>%
  add_data(bart_stations) %>%
  add_scatterplot_layer(
    data = get_data(),
    properties = main_properties,
    radiusScale = 6,
    getRadius = 50,
    getColor = c(240, 140, 20)
  ) %>%
  add_text_layer(
    data = get_data(),
    properties = main_properties,
    getText = get_property("name"),
    getAlignmentBaseline = "bottom"
  )
