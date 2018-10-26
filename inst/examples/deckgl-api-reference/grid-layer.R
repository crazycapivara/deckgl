## @knitr grid-layer
sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/sf-bike-parking.json"
)

properties <- list(
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = get_property("COORDINATES"),
  getTooltip = JS("object => `${object.position.join(', ')}<br/>Count: ${object.count}`"),
  fixedTooltip = TRUE
)

deck <- deckgl(zoom = 11, pitch = 45, bearing = 35) %>%
  add_grid_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
