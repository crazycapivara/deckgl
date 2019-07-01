library(deckgl)
library(sf)
library(spData)

deckgl(latitude = 48.864716, longitude = 2.349014, zoom = 7) %>%
  add_path_layer(
    data = seine,
    getPath = ~geometry,
    widthMinPixels = 2,
    widthScale = 20,
    getWidth = 5,
    getColor = c(0, 0, 255),
    getTooltip = ~name
  ) %>%
  add_mapbox_basemap()

