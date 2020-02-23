library(deckgl)
library(sf)
library(scales)

data_url <- paste0(
  "https://raw.githubusercontent.com/uber-common/deck.gl-data/",
  "master/examples/geojson/vancouver-blocks.json"
)
blocks <- st_read(data_url)

pal <- col_quantile("YlOrRd", blocks$growth, n = 4)
blocks$color <- pal(blocks$growth)

deckgl(latitude = 49.254, longitude = -123.13, zoom = 11, pitch = 45) %>%
  add_polygon_layer(
    data = blocks,
    getPolygon = ~geometry,
    opacity = 0.8,
    stroked = FALSE,
    filled = TRUE,
    extruded = TRUE,
    wireframe = TRUE,
    fp64 = TRUE,
    getElevation =  JS("f => Math.sqrt(f.valuePerSqm) * 10"),
    getFillColor = get_color_to_rgb_array("color"), # JS("f => [f.growth * 50, 140, 10]"),
    getLineColor =  c(255, 255, 255)
  ) %>%
  add_basemap(use_carto_style())
