library(deckgl)
library(sf)

features <- st_as_sf(bart_stations, coords = c("lng", "lat"), crs = 4326)[6:9, ]
path <- st_geometry(features) %>%
  st_coordinates() %>%
  st_linestring() %>%
  st_sfc(crs = 4326) %>%
  st_sf()

deckgl(zoom = 9.5, pitch = 35) %>%
  add_scatterplot_layer(
    data = features,
    getPosition = ~geometry,
    radiusScale = 6,
    getRadius = 100,
    getFillColor = c(240, 140, 20),
    getTooltip = ~name
  ) %>%
  add_path_layer(
    data = path,
    getPath = ~geometry,
    widthScale = 20,
    widthMinPixels = 2,
    getWidth = 5
  ) %>%
  add_mapbox_basemap()
