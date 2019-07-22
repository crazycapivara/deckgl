context("deckgl widget")

test_that("create widget", {
  # Prepare
  latitude <- 51.312801
  longitude <- 9.481544
  zoom <- 10
  pitch <- 35

  # Act
  deckgl <- deckgl(
    latitude = latitude,
    longitude = longitude,
    zoom = zoom,
    pitch = pitch
  )

  # Assert
  expect_equal(deckgl$x$latitude, latitude)
  expect_equal(deckgl$x$longitude, longitude)
  expect_equal(deckgl$x$zoom, zoom)
  expect_equal(deckgl$x$pitch, pitch)
  expect_equal(deckgl$x$layers, list())
})
