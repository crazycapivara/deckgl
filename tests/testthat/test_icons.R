context("icons")

test_that("default atlas image", {
  # Prepare
  sample_data <- "some_data"

  # Act
  deckgl <- deckgl() %>%
    add_icon_layer(data = sample_data, getSize = 20)
  properties <- properties_(deckgl)

  # Assert
  expect_equal(properties$iconAtlas, encode_icon_atlas())
  expect_equal(properties$iconMapping, list(marker = icon_definition()))
})

test_that("overwrite atlas image only", {
  # Prepare
  sample_data <- "some_data"
  custom_atlas_image <- "https://deck.gl/images/icon-atlas.png"

  # Act
  deckgl <- deckgl() %>%
    add_icon_layer(data = sample_data, iconAtlas = custom_atlas_image)

  # Assert
  expect_equal(properties_(deckgl)$iconAtlas, custom_atlas_image)
  expect_equal(properties_(deckgl)$iconMapping$marker, icon_definition())
})

test_that("custom icon properties", {
  # Prepare
  sample_data <- "some_data"
  custom_atlas_image <- "https://deck.gl/images/icon-atlas.png"
  properties <- list(iconAtlas = custom_atlas_image)

  # Act
  deckgl <- deckgl() %>%
    add_icon_layer(data = sample_data, properties = properties)

  # Assert
  expect_equal(properties_(deckgl)$iconAtlas, custom_atlas_image)
  expect_null(properties_(deckgl)$iconMapping)
})
