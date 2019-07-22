context("properties")

test_that("merge properties / keys to camel case", {
  # Prepare
  default_icon_properties <- list(
    iconAtlas = encode_icon_atlas(),
    iconMapping = list(marker = icon_definition()),
    getIcon = JS("d => 'marker'"),
    getColor = c(240, 140, 0)
  )
  # overwrite_and_add_properties <- list(
  #   getColor = c(140, 120, 0),
  #   getSize = 5
  # )

  # Act
  # properties <- utils::modifyList(
  #   default_icon_properties, overwrite_and_add_properties
  # )
  map <- deckgl() %>%
    add_icon_layer(
      properties = default_icon_properties,
      get_color = c(140, 120, 0),
      get_size = 5
    )
  properties <- map$x$layers[[1]]$properties

  # Assert
  expect_equal(properties$getColor, c(140, 120, 0))
  expect_equal(properties$getSize, 5)
  expect_equal(length(properties), 6)
})
