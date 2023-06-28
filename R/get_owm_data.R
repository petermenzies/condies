


get_owm_data <- function(location) {
  
  latitude <- location[[2]]
  longitude = location[[3]]
  
  # get 3h 5 day forecast
  forecast_3h <- get_forecast(lat = latitude, lon = longitude, units = "imperial") %>% 
    owmr_as_tibble() %>% 
    mutate(date = as.Date(dt_txt),
           time = as.numeric(substr(dt_txt, 12, 13)),
           time = case_when(time == 0 ~ "12am",
                            time == 12 ~ "12pm",
                            time > 12 ~ paste0(time - 12, "pm"),
                            time < 12 ~ paste0(time, "am")),
           dt_txt = ymd_hms(dt_txt, tz = Sys.timezone()),
           # rain_3h = ifelse(is.na(rain_3h), 0, rain_3h),
           precip = pop * 100) %>% 
    rename(datetime = dt_txt, cloud_cover = clouds_all) %>% 
    select(datetime, temp, precip, humidity, cloud_cover, wind_speed)

  # get current and hourly 2 day forecast
  url <- paste0("https://api.openweathermap.org/data/3.0/onecall?lat=", latitude, 
                "&lon=", longitude, "&exclude=minutely,daily,alert&appid=",
                OWM_API_KEY, "&units=imperial")
  
  r <- as.character(httr::GET(url))
  d <- jsonlite::fromJSON(r)
  
  forecast_1h <- d[["hourly"]] %>% 
    mutate(dt = as_datetime(dt, tz = Sys.timezone()),
           precip = 100 * pop) %>% 
    select(datetime = dt, temp, precip, humidity, cloud_cover = clouds, wind_speed)
  
  
  current <- d[["current"]][1:13] %>% 
    as.data.frame() %>% 
    mutate(desc = d[["current"]][["weather"]][["description"]],
           dt = as_datetime(dt, tz = Sys.timezone())) %>% 
    rename(datetime = dt) %>% 
    select(datetime, desc, temp, feels_like, wind_speed, cloud_cover = clouds, humidity)
  
  forecast_3h <- forecast_3h %>%  
    filter(datetime > max(forecast_1h$datetime))
  
  forecast <- forecast_1h %>% 
    bind_rows(forecast_3h)
  
  updated <- Sys.time()
  saveRDS(updated, "data/updated.RDS")
  
  current_filename <- paste0("data/", location[[1]], "_current.RDS")
  forecast_filename <- paste0("data/", location[[1]], "_forecast.RDS")
  
  saveRDS(current, current_filename)
  saveRDS(forecast, forecast_filename)
  
  return(list(current, forecast))
  
}

if (as.numeric(Sys.time() - updated, units = "secs") > 300) {
  
  for (i in seq_along(loc_names)) {
    
    loc <- get(loc_names[i])
    
    d <- get_owm_data(loc)
    loc_name <- loc_names[i]
    
    current <- d[[1]]
    forecast <- d[[2]]
    
    assign(paste0(loc_name, "_current"), current)
    assign(paste0(loc_name, "_forecast"), forecast)
    
  }
  
} else {
  
  for (i in seq_along(loc_names)) {
    
    current <- readRDS(paste0("data/", loc_names[i], "_current.RDS"))
    forecast <- readRDS(paste0("data/", loc_names[i], "_forecast.RDS"))
    
    assign(paste0(loc_names[i], "_current"), current)
    assign(paste0(loc_names[i], "_forecast"), forecast)
    
  }
  
}



creamery_desc <- creamery_current[["desc"]]
brickyard_desc <- brickyard_current[["desc"]]


