.onAttach <- function(libname, pkgname) { # nocov start
  mapbox_message <- ""
  if (Sys.getenv("MAPBOX_API_TOKEN") == "") {
    mapbox_message <- c(
      "\nIf you want to add a basemap from mapbox, ",
      "it is recommended that you store your API token in an environment variable called MAPBOX_API_TOKEN.\n"
    )
  }

  packageStartupMessage(
    pkgname, " ", getNamespaceVersion(pkgname), " wrapping deck.gl.js ", deckgljs_version(), "\n",
    "  Documentation: https://crazycapivara.github.io/deckgl/\n",
    "  Issues, notes and bleeding edge: https://github.com/crazycapivara/deckgl\n",
    mapbox_message
  )
} # nocov end


globalVariables(c("."))
