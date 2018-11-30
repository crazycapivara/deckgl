
<!-- README.md is generated from README.Rmd. Please edit that file -->
An R Interface to deck.gl
=========================

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/deckgl)](https://cran.r-project.org/package=deckgl) [![Travis-CI Build Status](https://travis-ci.org/crazycapivara/deckgl.svg?branch=master)](https://travis-ci.org/crazycapivara/deckgl) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

Deckgl for R makes the open-source JavaScript library [deck.gl](https://deck.gl/) available within R via the [htmlwidgets](https://www.htmlwidgets.org/) package.

Notes
-----

-   It is a known issue that the deckgl widget might not be visible in the viewer pane of RStudio. Just open it in your browser by clicking **Show in new window** and everything will be fine.
-   The [documentation](https://crazycapivara.github.io/deckgl/) is work in progress. Please check also the [examples](https://github.com/crazycapivara/deckgl/tree/master/inst/examples) as a starting point.
-   You do **not** need a [mapbox](https://www.mapbox.com/) api key to use this package. It is always optional to add a base map from mapbox to your widget.

Installation
------------

You can install deckgl from github with:

``` r
# install.packages("devtools")
devtools::install_github("crazycapivara/deckgl")
```

Quickstart
----------

Just check if everything is fine:

``` r
library(deckgl)

does_it_work()
#> You should see a text layer telling you that it works.

# Or in case you do have an api token from mapbox ...
does_it_work("yourSuperSecretApiToken")
#> Output should be the same as above but rendered on top of a base map from mapbox.
```

Show some sample data:

``` r
# Pass 'data = NULL' to load some sample data for the hexagon layer
deckgl() %>%
  add_hexagon_layer(data = NULL) %>%
  add_mapbox_basemap("yourSuperSecretApiToken") # optional
```

Usage
-----

Create a deckgl widget:

``` r
deckgl()
```

Add a base map from mapbox (optional):

``` r
Sys.setenv(MAPBOX_API_TOKEN = "yourSuperSecretApiToken")

deckgl() %>%
  add_mapbox_basemap(style = "mapbox://styles/mapbox/dark-v9")
```

Add any kind of layers:

``` r
# Grid layer example

sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/sf-bike-parking.json"
)

properties <- list(
  pickable = TRUE,
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = JS("data => data.COORDINATES"),
  getTooltip = JS("object => object.count")
)

deckgl(zoom = 11, pitch = 45) %>%
  add_grid_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap() # optional
```

-   The `data` parameter can either be an **url** to fetch data from or a **data object**. Furthermore, you can use `get_data` in conjunction with `add_data` to use a data file.
-   The `properties` parameter is a **named list** with names corresponding to the **properties** defined in the [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference) for the given **layer** class. For the example above see the [grid-layer-api-reference](https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer). In case the property is a **data accessor** (usually a function in the form of a lambda expression) just use the `JS` function in R to pass it to the layer object. In the example above this is done for the properties `getPosition` and `getTooltip`. It is also possible to pass properties as named arguments via the `...` parameter. They are appended to the properties list. Same properties will be overwritten.

Layers
------

Due to the generic function `add_layer` any kind of layer defined in the [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference) is supported. The type of layer is chosen via the `class_name` parameter, e. g. `ScatterplotLayer` or `GeoJsonLayer`. Usually you will not use the generic function but one of the `add_*_layer` shortcut functions instead:

``` r
# Generic function
deckgl() %>% add_layer("ArcLayer", "arc-layer", data, properties)

# Shortcut function
deckgl() %>% add_arc_layer("arc-layer", data, properties)
```

Run examples
------------

You can run the [api-examples](https://github.com/crazycapivara/deckgl/tree/master/inst/examples/deckgl-api-reference) from the `add_*_layer` functions with `example(add_*_layer)`. For the `IconLayer` it looks like this:

``` r
# Sys.setenv(MAPBOX_API_TOKEN = "yourSuperSecretApiToken")
example(add_icon_layer)
```

Concept
-------

Deckgl for R stays as close as possible to the JavaScript api so that usually all parameters of its JavaScript pendants are supported. Therefore, you need to check the [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference) of the JavaScript framework to get information about the parameters you can pass to the R-functions mostly as named lists or named arguments (`...` parameter). Use the `JS` function if you need to pass any kind of JavaScript code, as it is the case for **data accessors**.

[GridLayer](https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer) api-example:

``` javascript
// JavaScript code

const layer = new GridLayer({
  id: "grid-layer",
  data: data,
  extruded: true,
  cellSize: 200,
  elevationScale: 4,
  getPosition: d => d.COORDINATES,
});
```

``` r
# Corresponding R code

deck <- deckgl() %>%
  add_grid_layer(
    id = "grid-layer",
    data = data,
    extruded = TRUE,
    cellSize = 200,
    elevationScale = 4,
    getPosition = JS("d => d.COORDINATES")
  )
```

In this example all properties are passed as named arguments.

You can test your R code like this:

``` r
properties <- list(
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = get_property("COORDINATES")
)

htmlwidgets:::toJSON2(properties, pretty = TRUE)
#> {
#>   "extruded": true,
#>   "cellSize": 200,
#>   "elevationScale": 4,
#>   "getPosition": "data => data.COORDINATES"
#> }
```

Documentation
-------------

-   [deckgl for R](https://crazycapivara.github.io/deckgl/) (pkgdown-site)
-   [example scripts](https://github.com/crazycapivara/deckgl/tree/master/inst/examples)
-   [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference) (JavaScript framework)
