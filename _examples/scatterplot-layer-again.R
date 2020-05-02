require(owmr)

deckgl(zoom = 8) %>%
  add_scatterplot_layer(
    data = owmr::owm_cities,
    pickable = TRUE,
    radiusMinPixel = 10,
    getRadius = 1000,
    getColor = c(240, 140, 30),
    getPosition = JS("data => [data.lon, data.lat]"),
    onHover = JS("({object}) => { if (object) console.log(object.nm) }")
  )
