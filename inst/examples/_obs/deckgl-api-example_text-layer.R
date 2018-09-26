library(jsonlite)
library(tibble)

bart_stations <- system.file("sample-data/bart-stations.json", package = "deckgl") %>%
  read_json(simplifyVector = TRUE) %>%
  as.tibble()

deckgl(zoom = 10, pitch = 35) %>%
  add_text_layer(
    data = bart_stations,
    pickable = TRUE,
    getPosition = get_position("lat", "lng"),
    getText = JS("d => d.name"),
    getSize = 20,
    getAngle = 0,
    getTextAnchor = "middle",
    getAlignmentBaseline = "center",
    getTooltip = JS("object =>`${object.name}\n${object.address}`")
  ) %>%
  add_mapbox_basemap()
