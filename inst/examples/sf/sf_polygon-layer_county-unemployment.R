library(sf)
library(leaflet)
library(deckgl)

fn <- "https://github.com/uber-web/kepler.gl-data/raw/master/county_unemployment/data.geojson"

county_unemployment <- st_read(fn)
county_unemployment$color <- colorNumeric(
  "YlOrRd", county_unemployment$unemployment_rate)(county_unemployment$unemployment_rate)

lng_lat <- st_union(county_unemployment) %>% st_centroid() %>%
  st_coordinates() %>% as.vector()

deckgl(zoom = 2, longitude = lng_lat[1], latitude = lng_lat[2]) %>%
# deckgl(zoom = 2, longitude = -113.03283330722, latitude = 45.7377034204039) %>%
  add_polygon_layer(
    data = wellknown(county_unemployment),
    getPolygon = get_wellknown(),
    fill = TRUE,
    getFillColor = get_color_to_rgb_array("color")
  ) %>%
  add_mapbox_basemap()
