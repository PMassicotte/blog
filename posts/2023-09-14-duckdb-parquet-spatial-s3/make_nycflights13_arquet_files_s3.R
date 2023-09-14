library(arrow)
library(pins)
library(tidyverse)

library(nycflights13)

board <- board_s3(
  "nycflights13",
  region = "whatever",
  profile = "valeria",
  versioned = FALSE,
  endpoint = "https://s3.valeria.science"
)

pin_list(board)

# Some longitudes in the airports are positives, but they should be negatives
airports <- airports %>%
  mutate(
    lon = if_else(lon > 0, -lon, lon)
  )

pin_write(board, flights, "flights", type = "parquet", versioned = FALSE)
pin_write(board, weather, "weather", type = "parquet", versioned = FALSE)
pin_write(board, planes, "planes", type = "parquet", versioned = FALSE)
pin_write(board, airports, "airports", type = "parquet", versioned = FALSE)
pin_write(board, airlines, "airlines", type = "parquet", versioned = FALSE)
