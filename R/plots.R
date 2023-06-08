

make_precip_plot <- function(forecast) {
  
  p <- ggplot(forecast) +
    geom_line(aes(x = datetime, y = precip, group = 1), color = "blue") +
    geom_line(aes(x = datetime, y = humidity, group = 1), color = "lightblue") +
    geom_line(aes(x = datetime, y = cloud_cover, group = 1), color = "gray") +
    theme_light() +
    scale_x_datetime(date_labels = "%m/%d")
  
  p <- ggplotly(p)
  
  return(p)
  
}


make_temps_plot <- function(forecast) {
  
  p <- ggplot(forecast) +
    geom_line(aes(x = datetime, y = temp, group = 1), color = "orange") +
    theme_light() +
    scale_x_datetime(date_labels = "%m/%d")
  
  p <- ggplotly(p)
  
  return(p)
  
}

