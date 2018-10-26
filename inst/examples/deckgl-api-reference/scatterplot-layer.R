## @knitr scatterplot-layer
bart_stations <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/bart-stations.json"
)

properties <- list(
  getPosition = get_property("coordinates"),
  getRadius = JS("data => Math.sqrt(data.exits)"),
  radiusScale = 6,
  getColor = c(255, 140, 20)
)

deck <- deckgl(zoom = 10.5, pitch = 35) %>%
  add_scatterplot_layer(data = bart_stations, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
