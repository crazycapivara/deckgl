# Example GeoJsonLayer
# see also
# - https://deck.gl/#/documentation/deckgl-api-reference/layers/geojson-layer
# -----

geojson = "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart.geo.json"

deckgl(zoom = 10) %>%
  add_geojson_layer(data = geojson,
                    filled = TRUE,
                    extruded = TRUE,
                    getRadius = 100,
                    lineWidthScale = 20,
                    lineWidthMinPixels = 2,
                    getLineWidth = 1,
                    getLineColor = c(165, 42, 42),
                    getFillColor = c(160, 160, 180, 200),
                    getElevation = 30)
