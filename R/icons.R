

gen_desc_icon <- function(desc) {
  
  icon_name <- case_when(str_detect(desc, "sun") ~ "sun",
                         str_detect(desc, "cloud") ~ "cloud",
                         str_detect(desc, "rain") ~ "cloud-rain")
    
    return(icon_name)
  
}
