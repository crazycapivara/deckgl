context("parse sf to wellknown")

wellknown_column_name <- "geom_wkt"

test_that("multipolygon", {
  # Prepare
  nc <- system.file("shape/nc.shp", package = "sf") %>%
    sf::st_read(quiet = TRUE)

  # Act
  data <- wellknown(nc)

  # Assert
  expect_is(data, "data.frame")
  expect_true(wellknown_column_name %in% colnames(data))
  expect_true(grep("^POLYGON", data[, wellknown_column_name]) %>% all())
})

test_that("wellknown data accessor", {
  # Prepare
  javascript <- sprintf(
    "data => wellknown.parse(data.%s).coordinates", wellknown_column_name
  )

  # Act
  property <- get_wellknown()

  # Assert
  expect_is(property, "JS_EVAL")
  expect_equal(as.character(property), javascript)
})
