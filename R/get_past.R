


get_past_precip <- function(location) {
  
  dates <- Sys.Date() - 1:3
  
  precip_vals <- vector("numeric")
  
  for (date in seq_along(dates)) {
    
    url <- paste0("https://api.openweathermap.org/data/3.0/onecall/day_summary?lat=",
                  location[[1]], "&lon=", location[[2]], "&date=", dates[i], "&appid=",
                  OWM_API_KEY)
    
    r <- as.character(httr::GET(url))
    d <- jsonlite::fromJSON(r)
    
    precip <- d[["precipitation"]][["total"]]
    
    precip_vals <- c(precip_vals, precip)
    
  }
  
  past_precip <- data.frame("days_ago" = 1:3, "precip" = precip_vals)
  
  precip_update
  
  return(past_precip)
  
}


test <- get_past_precip(echo)

