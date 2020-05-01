library(geojsonio)
library(sf)

us_cities_sf <- st_as_sf(us_cities, coords = c("long", "lat"), crs = 4326)
us_cities_sf$marker <- ifelse(us_cities_sf$capital > 0, "marker2", "marker1")
xy <- st_bbox(us_cities_sf) %>%
  st_as_sfc() %>%
  st_centroid() %>%
  st_coordinates() %>%
  as.vector()

icon_mapping <- list(
  marker1 = use_icon_definition(), # default mapping
  marker2 = use_icon_definition(x = 128, mask = FALSE) # use second icon on the default atlas image
)

deckgl(longitude = xy[1], latitude = xy[2], zoom = 3) %>%
  add_icon_layer(
    data = us_cities_sf,
    iconMapping = icon_mapping,
    getIcon = JS("d => d.marker"),
    getPosition = ~geometry,
    pickable = TRUE,
    getSize = 3.5,
    sizeScale = 15,
    getTooltip = ~name
  ) %>%
  add_basemap()
