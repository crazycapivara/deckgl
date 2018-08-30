sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-zipcodes.json"

properties <- list(
  pickable = TRUE,
  stroked = TRUE,
  filled = TRUE,
  wireframe = TRUE,
  lineWidthMinPixels = 1,
  getPolygon = JS("d => d.contour"),
  getElevation = JS("d => d.population / d.area / 10"),
  getFillColor= JS("d => [d.population / d.area / 60, 140, 0]"),
  getLineColor = c(80, 80, 80),
  getLineWidth = 1,
  getTooltip = JS("object => `${object.zipcode}\nPopulation: ${object.population}`")
)

deckgl() %>%
  add_polygon_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()
