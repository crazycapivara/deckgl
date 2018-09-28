# deckgl 0.1.5

* Switched to `deckgl.js` 6.1.1
* Added helper functions `get_property` and `get_color_to_rgb_array`

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
