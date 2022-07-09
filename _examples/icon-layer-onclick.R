library(deckgl)

sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"

callback <- '
  function({ x, y, object }) {
    tooltip = document.getElementsByClassName("deckgl-widget-tooltip")[0];
    tooltip.style.display = "block";
    tooltip.innerHTML = object.name +  "</br>" + object.address;
    /* uncomment if you want to move the tooltip */
    // tooltip.style.top = y + "px";
    // tooltip.style.left = x + "px";
  }
'

deckgl() %>%
  # Use default icon
  add_icon_layer(
    data = sample_data,
    getPosition = ~coordinates,
    getColor = JS("d => [Math.sqrt(d.exits), 140, 0]"), # overwrite default color
    pickable = TRUE,
    # onClick = JS("info => console.log(info)")
    onClick = JS(callback)
  ) %>%
  add_basemap()
