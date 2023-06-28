


get_current_clean <- function(location) {
  
  latitude <- location[1]
  longitude = location[2]
  
  current <- get_current(lat = latitude, lon = longitude, units = "imperial") %>% 
    owmr_as_tibble()
  
  return(current)
  
}

creamery_current <- get_current_clean(creamery)
creamery_desc <- creamery_current[["weather_description"]]


brickyard_current <- get_current_clean(brickyard)
brickyard_desc <- brickyard_current[["weather_description"]]

echo_current <- get_current_clean(echo)
