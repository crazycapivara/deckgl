library(sf)
library(deckgl)

url <- "https://docs.mapbox.com/mapbox-gl-js/assets/significant-earthquakes-2015.geojson"
earthquakes <- st_read(url) %>%
  dplyr::select(mag, geometry)

deckgl(
  latitude = 20.7927,
  longitude = 31.4606,
  zoom = 0.5
) %>%
  add_scatterplot_layer(
    data = earthquakes,
    get_position = ~geometry,
    get_radius = "@=10000 * Math.pow(mag, 2)",
    get_fill_color = "@=[Math.pow(mag, 3), 140, 10, 160]",
    radius_min_pixels = 1,
    radiusMaxPixels = 100,
    radiusScale = 1,
    filled = TRUE
  ) %>%
  add_basemap()
