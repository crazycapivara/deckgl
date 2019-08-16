## @knitr column-layer
sample_data <- bart_stations
pal <- scales::col_quantile("YlOrRd", sample_data$exits)
sample_data$color <- pal(sample_data$exits)

deck <- deckgl(zoom = 9, pitch = 35) %>%
  add_column_layer(
    # data = bart_stations,
    data = sample_data,
    diskResolution = 10,
    radius = 500,
    getPosition = ~lng + lat,
    getElevation = ~exits,
    # getFillColor = JS("d => [48, 128, Math.sqrt(d.exits)]"),
    getFillColor = ~color,
    extruded = TRUE,
    getTooltip = ~name
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
