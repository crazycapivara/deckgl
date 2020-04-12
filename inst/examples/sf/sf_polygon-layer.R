library(deckgl)
library(sf)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE) %>%
  st_transform(4326)

pal <- scales::col_bin("YlOrRd", nc$AREA)
nc$fill_color <- pal(nc$AREA)

# sample_data <- spData::hawaii %>% st_transform(4326)

center <- st_bbox(nc) %>%
  st_as_sfc() %>%
  st_centroid() %>%
  st_coordinates() %>%
  as.vector()

deckgl(latitude = center[2], longitude = center[1], zoom = 6) %>%
  add_polygon_layer(
    filled = TRUE,
    data = nc,
    getPolygon = ~geometry,
    lineWidthMinPixels = 1,
    getLineColor = "white",
    getLineWidth = 1,
    # getFillColor = JS("d => [250, Math.sqrt(d.BIR74), 20, 200]"),
    getFillColor = ~fill_color,
    getTooltip = "<div>{{NAME}}</div><div>{{AREA}}</div>"
  ) %>%
  add_legend_pal(pal, title = "AREA", pos = "bottom-right", style = "margin-bottom: 30px;") %>%
  add_basemap()
