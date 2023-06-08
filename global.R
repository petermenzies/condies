librarian::shelf(shiny, shinydashboard, shinydashboardPlus, ggiraph, owmr, 
                 lubridate, dplyr, ggplot2, plotly, DT, ggiraph, stringr)

OWM_API_KEY <- readr::read_file("key.txt")

owmr_settings(api_key = OWM_API_KEY)


