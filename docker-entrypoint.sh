#!/bin/sh

if [ -n "$MAPBOX_API_TOKEN" ]; then
  echo "Add MAPBOX_API_TOKEN to Renviron"
  echo "MAPBOX_API_TOKEN=${MAPBOX_API_TOKEN}" >> /usr/local/lib/R/etc/Renviron
fi

exec "$@"

