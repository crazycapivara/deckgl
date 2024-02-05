bart_stations <- system.file("sample-data/bart-stations.json", package = "deckgl") %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  tibble::as.tibble()

main_properties <- list(
  getPosition = get_position("lat", "lng")
)
SOURCE_ID = 'bart-stations'

deckgl(zoom = 10, pitch = 35) %>%
  add_source(SOURCE_ID, data=bart_stations) %>%
  add_scatterplot_layer(
    source=SOURCE_ID,
    properties = main_properties,
    radiusScale = 6,
    getRadius = 50,
    getColor = c(240, 140, 20)
  ) %>%
  add_text_layer(
    source=SOURCE_ID,
    properties = main_properties,
    getText = get_property("name"),
    getAlignmentBaseline = "bottom"
  )
