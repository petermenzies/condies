



get_current_clean <- function(location) {
  
  latitude <- location[1]
  longitude = location[2]
  
  current <- get_current(lat = latitude, lon = longitude, units = "imperial") %>% 
    owmr_as_tibble()

}


get_forecast_clean <- function(location) {
  
  latitude <- location[1]
  longitude = location[2]
  
  forecast <- get_forecast(lat = latitude, lon = longitude, units = "imperial") %>% 
    owmr_as_tibble() %>% 
    mutate(date = as.Date(dt_txt),
           time = as.numeric(substr(dt_txt, 12, 13)),
           time = case_when(time == 0 ~ "12am",
                            time == 12 ~ "12pm",
                            time > 12 ~ paste0(time - 12, "pm"),
                            time < 12 ~ paste0(time, "am")),
           dt_txt = ymd_hms(dt_txt, tz = Sys.timezone()),
           rain_3h = ifelse(is.na(rain_3h), 0, rain_3h),
           precip = pop * 100) %>% 
    rename(datetime = dt_txt, rain_mm = rain_3h, cloud_cover = clouds_all) %>% 
    select(-c(weather_id, weather_icon, dt, visibility, sea_level, grnd_level,
              temp_kf, sys_pod, pop, pressure))
  
  return(forecast)
  
}







