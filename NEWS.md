# deckgl 0.1.8

* Switched to `deckgl.js` 6.2.4

# deckgl 0.1.7

* Switched to `deckgl.js` 6.2.3
* Added examples to r-docs for all `add_*_layer` functions
* Added helper functions to run api-examples, not exported yet:

```r
deckgl:::browse_api_examples()[1] %>%
  deckgl:::run_api_example()
deck
```

# deckgl 0.1.6

* Switched to `deckgl.js` 6.2.2
* Added more examples
* Added `...` parameter to `deckgl` to pass optional parameters to the `deck` instance:

```r
deckgl(
  zoom = 5,
  pickingRadius = 5,
  style = list(background = "black")
)
```

* Added functions `add_data` and `get_data` to pass _data objects_ as separate files:

```r
deckgl() %>%
  add_data(bart_stations) %>%
  add_scatterplot(data = get_data(), properties = properties)
```

# deckgl 0.1.5

* Switched to `deckgl.js` 6.1.1
* Added helper functions `get_property` and `get_color_to_rgb_array`:

```r
properties <- list(
  getText = JS("data => data.text")
)

# equals

properties <- list(
  getText = get_property("text")
)
```

* Refactored `deckgl-api-reference` examples for all core layers
* Updated and added vignettes for core layers
* Added `LICENSE.note` file

# deckgl 0.1.4

* Switched to `deckgl.js` 6.1.0
* Added missing `add_*_layer` functions for all core layers including `add_contour_layer` (new in version 6.1.0)
* Added helper functions `encode_icon_atlas`, `icon_definition` and `default_icon_properties` to set icons for the icon layer:

```r
icon_properties <- list(
  iconAtlas = encode_icon_atlas(),
  iconMapping = list(marker = icon_definition()),
  getIcon = JS("d => 'marker'"),
  ...
)
```

* Added on click event in `shinyMode` passing `info.object` and `latLng` back to R
* Added arguments `inititialViewState` and `views` to `deckgl` widget. If `views` is not supplied, a single `MapView` is created.
* Added more examples (see `point-cloud-laz-indoor-scan.R` example for how to use an `OrbitView`)

# deckgl 0.1.3

* Added a `NEWS.md` file to track changes to the package.
* Added support for tooltips:

```r
# Tooltip example for a grid layer

properties <- list(
  pickable = TRUE
  getTooltip = JS("object => `${object.position.join(', ')}\nCount: ${object.count}`")
  fixedTooltip = TRUE # show tooltip always on upper left corner,
  ...
)
```
