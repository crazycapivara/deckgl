sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

deckgl() %>%
  # Use default icon
  add_icon_layer(
    data = sample_data,
    getPosition = ~coordinates,
    getColor = JS("d => [Math.sqrt(d.exits), 140, 0]"), # overwrite default color
    pickable = TRUE,
    # onClick = JS("info => console.log(info)")
    onClick = JS("info => deckglWidget.tooltipElement.innerHTML = info.object.name")
  ) %>%
  add_basemap()
