## @knitr geojson-layer
geojson <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/bart.geo.json"
)

deck <- deckgl(zoom = 10, pickingRadius = 5) %>%
  add_geojson_layer(
    data = geojson,
    filled = TRUE,
    extruded = TRUE,
    getRadius = 100,
    lineWidthScale = 20,
    lineWidthMinPixels = 2,
    getLineWidth = 1,
    getLineColor = get_color_to_rgb_array("properties.color || 'black'"),
    getFillColor = c(160, 160, 180, 200),
    getElevation = 30,
    getTooltip = JS("object => object.properties.name || object.properties.station")
  ) %>%
  add_basemap()

if (interactive()) deck
