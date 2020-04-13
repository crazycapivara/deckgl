## @knitr hexagon-layer
data("sf_bike_parking")

properties <- list(
  extruded = TRUE,
  radius = 200,
  elevationScale = 4,
  getPosition = ~lng + lat,
  colorRange = RColorBrewer::brewer.pal(6, "Oranges"),
  tooltip = "
    <p>{{position.0}}, {{position.1}}<p>
    <p>Count: {{points.length}}</p>
    <p>{{#points}}<div>{{address}}</div>{{/points}}</p>
  ",
  onClick = JS("obj => console.log(obj)"),
  autoHighlight = TRUE
)

deck <- deckgl(zoom = 11, pitch = 45, bearing = 35) %>%
  add_hexagon_layer(data = sf_bike_parking, properties = properties) %>%
  add_control("Hexagon Layer", "top-left") %>%
  add_basemap()

if (interactive()) deck
