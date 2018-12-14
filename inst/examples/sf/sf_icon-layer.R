library(sf)
library(geojsonio)
library(deckgl)

sample_data <- st_as_sf(us_cities, coords = c("long", "lat"))

deckgl(zoom = 3) %>%
  add_icon_layer(
    data = wellknown(sample_data),
    getPosition = get_wellknown()
  ) %>%
  add_mapbox_basemap()
