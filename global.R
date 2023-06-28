librarian::shelf(shiny, shinydashboard, shinydashboardPlus, ggiraph, owmr, 
                 lubridate, dplyr, ggplot2, plotly, DT, ggiraph, stringr,
                 shinycssloaders)

OWM_API_KEY <- readr::read_file("key.txt")

# owmr_settings(api_key = OWM_API_KEY)
Sys.setenv(OWM_API_KEY = OWM_API_KEY)

updated <- readRDS("data/updated.RDS")

source("R/locations.R")
source("R/get_owm_data.R")
source("R/plots.R")
source("R/icons.R")
