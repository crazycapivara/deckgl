library(deckgl)

mapStyle = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"

deckgl(mapStyle = mapStyle) %>%
  add_hexagon_layer()

deckgl(mapStyle = mapStyle, element_id = "deckthat") %>%
  add_hexagon_layer(
    data = sf_bike_parking,
    getPosition = ~lng + lat,
    extruded = TRUE,
    radius = 200,
    elevationScale = 4,
    getTooltip = JS("object => object.points.length")
  )
