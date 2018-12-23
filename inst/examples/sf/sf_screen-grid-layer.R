library(sf)
library(deckgl)

sample_data <- st_as_sf(sf_bike_parking, coords = c("lng", "lat"), crs = 4326)

deck <- deckgl() %>%
  add_screen_grid_layer(
    data = sample_data,
    opacity = 0.8,
    cellSizePixels = 50
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
