.onAttach <- function(libname, pkgname){ # nocov start
  packageStartupMessage(
    pkgname, " ", getNamespaceVersion(pkgname), "\n",
    "  Documentation: https://crazycapivara.github.io/deckgl/\n",
    "  Issues, notes and bleeding edge: https://github.com/crazycapivara/deckgl\n"
  )
} # nocov end
