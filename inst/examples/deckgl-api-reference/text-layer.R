## @knitr text-layer
bart_stations <- system.file("sample-data/bart-stations.json", package = "deckgl") %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  tibble::as.tibble()

deckgl(zoom = 10, pitch = 35) %>%
  add_text_layer(
    data = bart_stations,
    pickable = TRUE,
    getPosition = get_position("lat", "lng"),
    getText = get_property("name"),
    getSize = 15,
    getAngle = 0,
    getTextAnchor = "middle",
    getAlignmentBaseline = "center",
    getTooltip = JS("object =>`${object.name}<br/>${object.address}`")
  ) %>%
  add_mapbox_basemap()
