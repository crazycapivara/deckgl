library(magrittr)
library(rlas)
library(data.table)

data <- rlas::read.las("data-raw/laz/indoor.0.1.laz", "xyz")

# Fit point cloud in a 1x1x1 box centered at [0, 0, 0]
values_max <- apply(data, 2, max)
values_min <- apply(data, 2, min)
values_mid <- (values_max + values_min) / 2

scale <- max(values_max - values_min)

data <- (sweep(data, 2, values_mid) / scale) %>%
  as.data.table()
