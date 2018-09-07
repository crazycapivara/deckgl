sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

deckgl() %>%
  # Use default icon
  add_icon_layer(
    data = sample_data,
    getPosition = get_position(coordinates = "coordinates"),
    pickable = TRUE,
    onClick = JS("info => console.log(info)")
  )
