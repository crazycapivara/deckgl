context("tooltips")

test_that("pickable not set", {
  # Prepare
  sample_data <- "some-sample-data"
  properties <- list(
    getTooltip = JS("object => `count: ${object.points.length}`")
  )

  # Act
  deckgl <- deckgl() %>%
    add_hexagon_layer(data = sample_data, properties = properties)

  # Assert
  expect_equal(properties_(deckgl)$pickable, TRUE)
})

test_that("pickable set to FALSE", {
  # Prepare
  sample_data <- "some-sample-data"
  properties <- list(
    pickable = FALSE,
    getTooltip = JS("object => `count: ${object.points.length}`")
  )

  # Act
  deckgl <- deckgl() %>%
    add_hexagon_layer(data = sample_data, properties = properties)

  # Assert
  expect_equal(properties_(deckgl)$pickable, FALSE)
})
