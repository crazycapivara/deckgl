library(deckgl)
library(sf)
library(spData)

make_color <- function(x) {
  c(as.integer(sqrt(x)) * 2, 140, 10, 50)
}

sample_data <- lnd
sample_data$color = I(lapply(sample_data$HECTARES, make_color))

deckgl(longitude = -0.118092, latitude = 51.509865) %>%
  add_polygon_layer(
    data = sample_data,
    getPolygon = ~geometry,
    getTooltip = ~NAME,
    filled = TRUE,
    getFillColor = ~color,
    lineWidthMinPixels = 2,
    getLineColor = c(250, 80, 80),
    getLineWidth = 5
  ) %>%
  add_mapbox_basemap()
