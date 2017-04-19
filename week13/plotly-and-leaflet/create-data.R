library(leaflet)
library(dplyr)
library(readr)

#39.9544396,-75.2213925

set.seed(2017-04-18)

houses <- data_frame(lng = rnorm(100, -75.2213925, .005),
                     lat = rnorm(100, 39.9544396, .005),
                     year_built = sample(1920:2015, size = 100, replace = TRUE),
                     price = sample(100:1000, size = 100, replace = TRUE),
                     bedrooms = sample(1:3, size = 100, replace = TRUE))
houses$price <- houses$price + (houses$year_built - 1920) * 25
houses$prop_tax <- abs(houses$lng - -75.2213925 + houses$lat - 39.9544396) * 500
houses$price <- houses$price + houses$prop_tax * 10 + houses$bedrooms * 5
houses$price <- round(houses$price)
houses$prop_tax <- round(houses$prop_tax, 2)

# plot(houses$year_built, houses$price)
# plot(houses$prop_tax, houses$price)
# 
# houses %>%
#   leaflet() %>%
#   addTiles() %>%
#   setView(-75.2213925, 39.9544396, 13) %>%
#   addMarkers()

write_csv(houses, "houses.csv")
