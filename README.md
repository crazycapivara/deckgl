
<!-- README.md is generated from README.Rmd. Please edit that file -->
An R Interface to deck.gl
=========================

[![Travis-CI Build Status](https://travis-ci.org/crazycapivara/deckgl.svg?branch=master)](https://travis-ci.org/crazycapivara/deckgl)

Deckgl for R makes the open-source JavaScript library [deck.gl](https://deck.gl/) available within R via the [htmlwidgets](https://www.htmlwidgets.org/) package.

Notes
-----

-   It is a known issue that the deckgl widget might not be visible in the viewer pane of RStudio. Just open it in your browser by clicking *Show in new window* and everything will be fine.
-   The [documentation](https://crazycapivara.github.io/deckgl/) is work in progress. Please check the [examples](inst/examples) as a starting point.
-   You do *not* need a [mapbox](https://www.mapbox.com/) api key to use this package. It is always optional to add a base map from mapbox to your widget.

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

sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

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

-   The `data` parameter can either be an *url* to fetch data from or a *data object*
-   The `properties` parameter is a *named list* with names corresponding to the properties defined in the [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference) for the given layer class. For the example above see [grid-layer-api-reference](https://deck.gl/#/documentation/deckgl-api-reference/layers/grid-layer). In case the property is a function (usually in the form of a lambda expression), just use the `JS` function in R to pass it to the layer object. In the example above this is done for the properties `getPosition` and `getTooltip`.

Layers
------

Due to the generic function `add_layer` any kind of layer defined in the deckgl-api-reference is supported. The type of layer is chosen via the `class_name` parameter, e. g. `ScatterplotLayer` or `GeoJsonLayer`. Usually you will not use the generic function but one of the `add_*_layer` shortcut functions instead:

``` r
# Generic function
deckgl() %>% add_layer("ArcLayer", "arc-layer", data, properties)

# Shortcut function
deckgl() %>% add_arc_layer("arc-layer", data, properties)
```

Documentation
-------------

-   [deckgl-api-reference for R](https://crazycapivara.github.io/deckgl/)
-   [example scripts](inst/examples)
-   [deckgl-api-reference](https://deck.gl/#/documentation/deckgl-api-reference)
