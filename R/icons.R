

gen_desc_icon <- function(desc) {

  icon_params <- case_when(str_detect(desc, "sun") ~ list(name = "sun", class = NULL),
                         str_detect(desc, "cloud") ~ list(name = "cloud", class = NULL),
                         str_detect(desc, "rain") ~ list(name = "cloud-rain", class = NULL),
                         str_detect(desc, "mist") ~ list(name = NULL, class = "mist-icon")
  )
  
  
  return(
    icon(icon_params[["name"]], icon_params[["class"]])
  )

}


gen_box_color <- function(desc) {
  
  box_color <- case_when(str_detect(desc, "sun|clear") ~ "light-blue",
                           str_detect(desc, "cloud") ~ "gray",
                           str_detect(desc, "rain") ~ "gray",
                           str_detect(desc, "mist") ~ "gray"
  )
  
  return(box_color)
  
}


