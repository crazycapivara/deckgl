
<!-- README.md is generated from README.Rmd. Please edit that file -->
An R Interface to deck.gl
=========================

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/deckgl)](https://cran.r-project.org/package=deckgl) [![Travis-CI Build Status](https://travis-ci.org/crazycapivara/deckgl.svg?branch=master)](https://travis-ci.org/crazycapivara/deckgl) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) [![deck.gl Version](https://img.shields.io/badge/deck.gl-v8.1.0-blue.svg)](https://github.com/uber/deck.gl/releases/tag/v8.1.0)

The deckgl package makes the open-source JavaScript library [deck.gl](https://deck.gl/) available within R via the [htmlwidgets](https://www.htmlwidgets.org/) package.

Concept
-------

The deckgl package stays as close as possible to the [deck.gl JavaScript API](https://deck.gl/#/documentation/deckgl-api-reference), so that normally all parameters of its JavaScript counterparts are supported.

### Named Parameters

Layer properties are passed to the `add_*_layer` functions as named list or named parameters via the `...` parameter. See the [deck.gl Layer Catalog](https://github.com/uber/deck.gl/tree/master/docs/layers#deckgl-layer-catalog-overview) to determine the available parameters for the used layer. According to the style conventions in R, `camelCased` parameters in deck.gl can be passed as `snake_cased` parameters in R.

[GridLayer](https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer) API Example:

``` javascript
// JavaScript code

const layer = new GridLayer({
  id: "grid-layer",
  data: data,
  extruded: true,
  cellSize: 200,
  elevationScale: 4,
  getPosition: d => [d.lng, d.lat]
});
```

``` r
# Corresponding R code

# using named arguments
deck <- deckgl() %>%
  add_grid_layer(
    id = "grid-layer",
    data = data,
    extruded = TRUE,
    cell_size = 200,
    elevation_scale = 4,
    get_position = ~lng + lat
  )

# ... using a named props list
props <- list(
  cellSize = 200,
  extruded = TRUE,
  # ...
)

deckgl() %>%
  add_grid_layer(
    data = data,
    properties = props
  )
```

Installation
------------

``` r
install.packages("deckgl")
```

You can install the latest version of deckgl from github with:

``` r
# install.packages("remotes")
remotes::install_github("crazycapivara/deckgl")
```

Quickstart
----------

Create a `deckgl` instance:

``` r
deckgl()
```

Add a basemap:

``` r
deckgl() %>%
  add_basemap()
```

Add any kind of layers:

``` r
# Grid layer example
data("sf_bike_parking")

props <- list(
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = ~lng + lat,
  tooltip = "Count: {{count}}"
)

deckgl(zoom = 11, pitch = 45) %>%
  add_basemap() %>%
  add_grid_layer(data = sf_bike_parking, properties = props)
```

The `deckgl` Instance
---------------------

The `deckgl` function creates the widget / renderer to which you add layers and other configuration parameters:

``` r
rdeck <- deckgl(
  latitude = 37.8,
  longitude = -122.45,
  zoom = 12
)
```

Layers
------

Due to the generic function `add_layer` any kind of layer defined in the [deck.gl API Reference](https://deck.gl/#/documentation/deckgl-api-reference) is supported. The layer type is chosen via the `class_name` parameter, e. g. `ScatterplotLayer` or `GeoJsonLayer`. Usually you will not use the generic function but one of the `add_*_layer` shortcut functions instead:

``` r
# Generic function
deckgl() %>%
  add_layer("ArcLayer", id, data, properties)

# Shortcut function
deckgl() %>%
  add_arc_layer(id, data, properties)
```

Data
----

The `data` parameter can either be an url to fetch data from or a data object. In most cases you will pass an object of type `data.frame` to the layers. Use the formula syntax to define data accessors that deck.gl uses to access the properties of the data object:

``` r
props <- list(
  getPosition: ~lng + lat
  # ...
)
```

### Data objects of class `sf`

An object of class [sf](https://github.com/r-spatial/sf) is a `data.frame` with a geometry list-column. Set the layer prop that fetches the geometry to the geometry column of your `sf` object:

``` r
# Example: PolygonLayer

props <- list(
  getPolygon = ~geometry
  # ...
)
```

Layer Props
-----------

The `properties` parameter is a named list with names corresponding to the properties defined in the [deck.gl API Reference](https://deck.gl/#/documentation/deckgl-api-reference) for the given layer type / class. For the example above see the [GridLayer API Reference](https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer) for available props.

It is also possible to pass properties as named arguments via the `...` parameter. They are appended to the properties list. Same properties will be overwritten.

See the [deck.gl Layer Catalog](https://github.com/visgl/deck.gl/tree/master/docs/layers#deckgl-layer-catalog-overview) for a full list of available layers and their properties.

### Camels or Snakes

While deck.gl uses `camelCased` parameters according to the JavaScript standard, the R style conventions usually prefer `snake_cased` parameters. Therefore, all parameters that are passed to deck.gl can use `snake_case`, e. g. `getPosition` can be passed to deck.gl as `get_position`.

### Data Accessors

Use the formula syntax to define data accessors:

``` r
props <- list(
  getPosition = ~lng + lat # js: d => [d.lng, d.lat]
  getFillColor = ~color # js: d => d.color
  # ...
)
```

The example above assumes that your data contains the columns `lng`, `lat` and `color`.

It is also possible to pass JavaScript code by using the `JS` function in R:

``` r
props <- list(
  getColor = JS("d => d.capital ? [140, 10, 10] : [60, 10, 10]")
  # ...
)
```

### Colors

In deck.gl colors are represented by `[r, g, b, a]` arrays. In R you can pass hex color codes to all color props of the `add_*_layer` functions. They are automatically converted to the required format.

Tooltips
--------

The tooltip for a layer can be set via the `tooltip` parameter. You can either pass a single template string or a list with the following properties (see also `use_tooltip`):

-   `html`: A template string that will be set as the `innerHTML` of the tooltip.
-   `style`: A `cssText` string that will modefiy the default style of the tooltip.

### Tooltip template Syntax

The tooltip string is a so called "mustache" template in which variable names are identified by the double curly brackets that surround them. The variable names available to the template are given by deck.gl’s `pickingInfo.object` and vary by layer.

See [mustache](https://github.com/janl/mustache.js) for a complete syntax overwiew.

``` r
data("bart_segments")

props <- list(
  getWidth = 12,
  getSourcePosition = ~from_lng + from_lat,
  getTargetPosition = ~to_lng + to_lat,
  getSourceColor = "yellow",
  getTargetColor = "orange",
  tooltip = use_tooltip(
    html = "{{from_name}} to {{to_name}}",
    style = "background: steelBlue; border-radius: 5px;"
  )
)

deckgl(zoom = 9.5, pitch = 35) %>%
  add_arc_layer(data = bart_segments, properties = props) %>%
  add_basemap()
```

Controls
--------

Controls are displayed as overlays on top of the map / deck. Usually you can set the position and the style of the control. The most basic control is a simple text box:

``` r
deckgl() %>%
  add_basemap() %>%
  add_control(
    html = "Plain Base Map",
    pos = "top-right",
    style = "background: steelblue; color: white"
  )
```

### Legends

With `add_legend` you can add a custom legend to your widget:

``` r
deckgl() %>%
  add_basemap() %>%
  add_legend(
    colors = c("yellow", "orange"),
    labels = c("Cake", "Icecream"),
    title = "Sweets"
  )
```

In most cases, you will create the legend automatically using a palette function:

``` r
data_column <- 1:10
pal <- scales::col_bin("Blues", data_column, bins = 5)
deckgl() %>%
  add_basemap() %>%
  add_legend_pal(pal, title = "Blues")
```

Basemaps
--------

By default, `add_basemap` adds a [carto Basemap](https://carto.com/developers/carto-vl/reference/#cartobasemaps) to the widget.

To use basemaps from [mapbox](https://www.mapbox.com/maps/) it is recommended that you store your API access token in an environment variable called `MAPBOX_API_TOKEN`:

``` r
# If not set globally
#Sys.setenv(MAPBOX_API_TOKEN = "xyz")

deckgl() %>%
  add_mapbox_basemap("mapbox://styles/mapbox/light-v9")
```

Run Examples
------------

You can run the [API Examples](https://github.com/crazycapivara/deckgl/tree/master/inst/examples/deckgl-api-reference) from the `add_*_layer` functions with `example(add_*_layer)`:

``` r
example(add_grid_layer)
```

Development
-----------

The JavaScript library of deckgl uses [webpack](https://webpack.js.org/) as module bundler. Therefore, you need [node.js](https://nodejs.org) to build the module. All JavaScript code is located in the `javascript/src` folder and test components go to `javascript/src/test-components`.

Build the library from inside the `javascript` folder with:

``` bash
npm run build
```

To spin up the [webpack-dev-server](https://github.com/webpack/webpack-dev-server) run:

``` bash
npm run start
```

Documentation
-------------

-   [deckgl for R](https://crazycapivara.github.io/deckgl/) (pkgdown-site)
-   [example scripts](https://github.com/crazycapivara/deckgl/tree/master/inst/examples)
-   [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference) (JavaScript framework)

Notes
-----

-   It is a known issue that the *deckgl widget* might not be visible in the viewer pane of RStudio. Just open it in your browser by clicking *Show in new window* and everything will be fine.
-   The [documentation](https://crazycapivara.github.io/deckgl/) is work in progress. See also the [examples](https://github.com/crazycapivara/deckgl/tree/master/inst/examples) as a good starting point.
