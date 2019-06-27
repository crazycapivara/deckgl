library(deckgl)
library(sf)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE)

nc <- st_cast(nc, "POLYGON")
nc4326 <- st_transform(nc, 4326)

center <- st_bbox(nc) %>% st_as_sfc() %>% st_centroid() %>% st_coordinates() %>% as.vector()

deckgl(latitude = center[2], longitude = center[1], zoom = 6) %>%
  add_polygon_layer(
    filled = TRUE,
    data = nc4326,
    getPolygon = ~geometry,
    lineWidthMinPixels = 1,
    getLineColor = c(250, 80, 80),
    getLineWidth = 1,
    getFillColor = JS("d => [250, Math.sqrt(d.BIR74), 20, 200]"),
    getTooltip = ~NAME
  ) %>%
  add_mapbox_basemap()
