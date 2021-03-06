data("bart_stations")

properties <- list(
  getPosition = ~lng + lat,
  getRadius = "@=Math.sqrt(exits)", #JS("data => Math.sqrt(data.exits)"),
  radiusScale = 6,
  getFillColor = "@=code === 'LF' ? 'white': 'red'", #c(255, 140, 20),
  tooltip = "{{name}}"
)

deck <- deckgl(zoom = 10.5, pitch = 35) %>%
  add_scatterplot_layer(data = bart_stations, properties = properties) %>%
  add_basemap() %>%
  add_control("Scatterplot Layer")

if (interactive()) deck
