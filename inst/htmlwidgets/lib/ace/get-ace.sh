#!/bin/sh

VERSION=1.4.11
BASE_URL=https://cdnjs.cloudflare.com/ajax/libs/ace/$VERSION

wget $BASE_URL/ace.min.js
wget $BASE_URL/mode-json.min.js
wget $BASE_URL/theme-idle_fingers.min.js

