# deckgl 0.2.7

* __Get Started__ vignette
* Group API Reference
* deck.gl v8.1.4
* Data Sources as deps

## deckgl 0.2.7-beta.2

* Update README
* deck.gl v8.1.3

## deckgl 0.2.7-beta.1

* Use __Ace__ only as JSON Editor
* deck.gl v8.1.2

## deckgl 0.2.7-alpha.1

* JSON Editor
* Data Sources

# deckgl 0.2.6

* Get Started Docs: `README.md`

## deckgl 0.2.6-beta.4

* Custom legend control: `add_legend`
* Automatic legend control creating elements from a palette function: `add_legend_pal`
* Support _snake case_ properties

## deckgl 0.2.6-beta.3

* Hex color specifiers for all _color_ data accessors and for the `colorRange` property
are automatically converted to rgba values as required by deckgl

## deckgl 0.2.6-beta.2

* Tooltip templates and styles: `use_tooltip`

## deckgl 0.2.6-beta.1

* Switched to `deck.gl.js` v8.1.0
* Added func `add_control` to add controls to the widget

# deckgl 0.2.5-cran

* Switched to `deck.gl.js` v8.0.17
* Fixed bug in vignettes when building docs with `pkgdown`

# deckgl 0.2.5

Renamed

* `icon_definition` to `use_icon_definition`
* `contour_definition` to `use_contour_definition`
* `default_icon_properties` to `use_default_icon_properties`

# deckgl 0.2.4

* Switched to `deck.gl.js` v8.0.16
* Switched to `mapbox-gl.js` v1.8.0
* Refactored dependencies (uses `deps.yaml` now)
* Added `use_carto_style` and `add_basemap` using a basemap from carto as default
* Added sample data for column and grid cell layer
* Changed parameter order in `add_mapbox_basemap`, so that `style` is the first parameter now

# deckgl 0.2.3

* Switched to `deck.gl.js` v8.0.15
* `add_heatmap_layer`
* `add_grid_cell_layer`

# deckgl 0.2.2

* Added `deckgl_proxy` and `update_deckgl` to update layers in _shiny_ mode

# deckgl 0.2.1

* Switched to `deck.gl.js` v7.1.7
* Added support for `sf` objects as `data` parameter
* Added _formula_ syntax for data accessors
* Added more examples (see  folder `sf` on how to pass `sf` objects to the layers)

```r
properties <- list(
  getPosition = JS("d => [d.lng, d.lat]")
  getRadius = JS("d => d.radius")
)

# equals

properties <- list(
  getPosition = ~lng + lat,
  getRadius = ~radius
)
```

# deckgl 0.2.0

* Switched to `deck.gl.js` v7.1.6
* `add_column_layer`
* `add_great_circle_layer`
* `add_bitmap_layer`
* `add_h3_cluster_layer`
* `add_h3_hexagon_layer`
* `add_raster_tile_layer`

# deckgl 0.1.9

* Switched to `deck.gl.js` v6.3.0
* Switched to `mapbox-gl.js` v0.51.0
* Updated api example of `ScreenGridLayer`
* Added `HexagonLayer` example of _road-safety-in-uk_

# deckgl 0.1.8

* Switched to `deck.gl.js` v6.2.4
* cran release

# deckgl 0.1.7

* Switched to `deck.gl.js` v6.2.3
* Added examples to r-docs for all `add_*_layer` functions
* Added helper functions to run api-examples, not exported yet:

```r
deckgl:::browse_api_examples()[1] %>%
  deckgl:::run_api_example()
deck
```

# deckgl 0.1.6

* Switched to `deck.gl.js` v6.2.2
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

* Switched to `deck.gl.js` 6.1.1
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

* Switched to `deck.gl.js` v6.1.0
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
