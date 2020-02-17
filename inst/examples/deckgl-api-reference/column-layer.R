## @knitr column-layer
data("bart_stations")

deck <- deckgl(zoom = 9, pitch = 35) %>%
  add_column_layer(
    data = bart_stations,
    diskResolution = 10,
    radius = 500,
    getPosition = ~lng + lat,
    getElevation = ~exits,
    getFillColor = JS("d => [48, 128, Math.sqrt(d.exits)]"),
    extruded = TRUE,
    getTooltip = ~name
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
