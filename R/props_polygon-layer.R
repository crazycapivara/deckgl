props_polygon_layer <- list(
  # render options
  filled = TRUE,
  stroked = FALSE,
  extruded = FALSE,
  wireframe = FALSE,
  elevation_scale = 1,
  line_width_units = "meters",
  line_width_min_pixels = 0,
  line_width_max_pixels = NULL,
  line_joint_rounded = FALSE,
  line_miter_limit = 4,
  line_dash_justified = FALSE,
  material = NULL,
  # data accessors
  get_polygon = ~geometry,
  get_fill_color = c(0, 0, 0, 255),
  get_line_color = c(0, 0, 0, 255),
  get_line_width = 1,
  get_elevation = 1000
)
