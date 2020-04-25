context("properties")

test_that("merge properties", {
  # Prepare
  default_icon_properties <- list(
    iconAtlas = encode_icon_atlas(),
    iconMapping = list(marker = use_icon_definition()),
    getIcon = JS("d => 'marker'"),
    getColor = c(240, 140, 0)
  )

  # Act
  deck <- deckgl() %>%
    add_icon_layer(
      data = "some-data",
      properties = default_icon_properties, getColor = c(140, 120, 0), getSize = 5)
  properties <- get_layer_props(deck) #deck$x$layers[[1]]$properties

  # Assert
  expected_properties <- c(
    "id",
    "iconAtlas",
    "iconMapping",
    "getIcon",
    "getColor",
    "getSize"
  ) %>% sort()
  expect_equal(properties$getColor, c(140, 120, 0))
  expect_equal(length(properties), 6)
  expect_equal(sort(names(properties)), expected_properties)
})
