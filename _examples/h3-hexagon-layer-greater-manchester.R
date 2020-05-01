library(tibble)
library(deckgl)
library(h3)

h3_index <- geo_to_h3(road_safety_greater_manchester)
sample_data <- table(h3_index) %>%
  as_tibble()

deck <- deckgl(
  zoom = 9,
  latitude = 53.483959,
  longitude = -2.244644
) %>%
  add_h3_hexagon_layer(
    data = sample_data,
    getHexagon = ~h3_index,
    getElevation = ~n,
    elevationScale = 100,
    getFillColor = JS("d => [240, d.n * 10, 10]"),
    getTooltip = ~n
  ) %>%
  add_mapbox_basemap()

if (interactive()) deck
