context("properties")

test_that("merge properties", {
  # Prepare
  default_icon_properties <- list(
    iconAtlas = encode_icon_atlas(),
    iconMapping = list(marker = use_icon_definition()),
    getIcon = JS("d => 'marker'"),
    getColor = c(240, 140, 0)
  )
  overwrite_and_add_properties <- list(
    getColor = c(140, 120, 0),
    getSize = 5
  )

  # Act
  properties <- merge_properties(
    default_icon_properties, overwrite_and_add_properties
  )

  # Assert
  expect_equal(properties$getColor, c(140, 120, 0))
  expect_equal(length(properties), 5)
})
