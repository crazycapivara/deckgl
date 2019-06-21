## @knitr column-layer
deck <- deckgl(zoom = 9, pitch = 35) %>%
  add_column_layer(
    data = bart_stations,
    diskResolution = 10,
    radius = 500,
    getPosition = get_position("lat", "lng"),
    getElevation = get_property("exits"),
    getFillColor = JS("d => [48, 128, Math.sqrt(d.exits)]"),
    extruded = TRUE,
    getTooltip = get_property("name")
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
