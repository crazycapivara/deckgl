## @knitr scatterplot-layer
data("bart_stations")

properties <- list(
  getPosition = ~lng + lat,
  getRadius = JS("data => Math.sqrt(data.exits)"),
  radiusScale = 6,
  getFillColor = c(255, 140, 20),
  getTooltip = ~name
)

deck <- deckgl(zoom = 10.5, pitch = 35) %>%
  add_scatterplot_layer(data = bart_stations, properties = properties) %>%
  add_basemap() %>%
  add_control("Scatterplot Layer")

if (interactive()) deck
