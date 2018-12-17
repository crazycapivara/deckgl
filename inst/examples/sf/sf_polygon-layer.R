library(sf)
library(leaflet)
library(deckgl)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE)

nc$color <- colorBin("YlOrRd", nc$AREA)(nc$AREA)

lng_lat <- st_coordinates(nc) %>% apply(2, median) %>%
  .[c("X", "Y")] %>% unname()

properties <- list(
  stroked = TRUE,
  filled = TRUE,
  wireframe = TRUE,
  lineWidthMinPixels = 1,
  getPolygon = get_wellknown(),
  getFillColor = get_color_to_rgb_array("color"),
  getLineColor = c(80, 80, 80),
  getLineWidth = 1,
  getTooltip = get_property("AREA")
)

deck <- deckgl(longitude = lng_lat[1], latitude = lng_lat[2], zoom = 6) %>%
  add_polygon_layer(data = wellknown(nc), properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck

# Parse 'sf' object automatically
deckgl(longitude = lng_lat[1], latitude = lng_lat[2], zoom = 6) %>%
  add_polygon_layer(
    data = nc,
    getFillColor = get_color_to_rgb_array("color")
  )
