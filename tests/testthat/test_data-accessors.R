context("data accessors")

test_that("formula syntax", {
  # Prepare
  properties <- list(
    getPosition = ~lng + lat,
    getTooltip = ~name
  )

  # Act
  properties <- formula_to_property(properties)

  # Assert
  expect_is(properties$getPosition, "list")
  expect_equal(properties$getPosition$dataAccessor, c("lng", "lat"))
  expect_equal(properties$getTooltip$dataAccessor, "name")
})
