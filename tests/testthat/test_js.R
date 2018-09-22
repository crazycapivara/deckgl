context("JavaScript code / data accessors")

test_that("get property", {
  # Prepare
  property_name <- "coordinates"

  # Act
  js_code <- get_property(property_name)

  # Assert
  expect_equal(js_code, JS("data => data.coordinates"))
})

test_that("get color", {
  # Prepare
  color_property <- "color"

  # Act
  js_code <- get_color_to_rgb_array(color_property)

  # Assert
  expect_equal(js_code, JS("d => deckglWidget.colorToRGBArray(d.color)"))
})
