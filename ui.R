

ui <- dashboardPage(
  
  # skin = "purple-light",

  
  dashboardHeader(title = "SB Condies"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )),
  dashboardBody(
    
    # link stylesheet
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                
                # CREAMERY ----
                
                box(
                  title = "Creamery",
                  collapsible = TRUE,
                  width = 11,
                  solidHeader = TRUE,
                  background = gen_box_color(creamery_desc),
                  status = if (str_detect(creamery_desc, "rain")) {"warning"}
                           else {NULL},
                  
                  ## CURRENT ----
                  
                  column(
                    width = 3,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "red", 
                      numberIcon = gen_desc_icon(creamery_desc),
                      header = paste0(creamery_desc), 
                      text = br(),
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),

                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("temperature-full"),
                      header = paste0(creamery_current[["temp"]], "ºF"), 
                      text = "temp",
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("temperature-half"),
                      header = paste0(creamery_current[["feels_like"]], "ºF"), 
                      text = "feels like",
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("wind"),
                      header = paste0(creamery_current[["wind_speed"]], "MPH"), 
                      text = "wind speed",
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("droplet"),
                      header = paste0(creamery_current[["humidity"]], "%"), 
                      text = "humidity",
                      rightBorder = FALSE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  ## FORECAST ----
                  
                  box(
                    title = "Temps Forecast",
                    collapsible = TRUE,
                    collapsed = TRUE,
                    width = 12,
                    background = gen_box_color(creamery_desc),
                    plotlyOutput("creamery_temps")
                  ),
                  
                  box(
                    title = "Precip Forecast",
                    collapsible = TRUE,
                    collapsed = TRUE,
                    width = 12,
                    background = gen_box_color(creamery_desc),
                    plotlyOutput("creamery_precip")
                  )
                ),
                
                # BRICKYARD ----
                
                box(
                  title = "Brickyard",
                  collapsible = TRUE,
                  width = 11,
                  solidHeader = TRUE,
                  background = gen_box_color(brickyard_desc),
                  status = if (str_detect(brickyard_desc, "rain")) {"warning"}
                  else {NULL},
                  
                  ## CURRENT ----
                  
                  column(
                    width = 3,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "red", 
                      numberIcon = gen_desc_icon(brickyard_current[["desc"]]),
                      header = paste0(brickyard_current[["desc"]]), 
                      text = br(),
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("temperature-full"),
                      header = paste0(brickyard_current[["temp"]], "ºF"), 
                      text = "temp",
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("temperature-half"),
                      header = paste0(brickyard_current[["feels_like"]], "ºF"), 
                      text = "feels like",
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("wind"),
                      header = paste0(brickyard_current[["wind_speed"]], "MPH"), 
                      text = "wind speed",
                      rightBorder = TRUE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  column(
                    width = 2,
                    descriptionBlock(
                      number = NULL, 
                      # numberColor = "green", 
                      numberIcon = icon("droplet"),
                      header = paste0(brickyard_current[["humidity"]], "%"), 
                      text = "humidity",
                      rightBorder = FALSE,
                      marginBottom = FALSE
                    )
                  ),
                  
                  ## FORECAST ----
                  
                  box(
                    title = "Temps Forecast",
                    collapsible = TRUE,
                    collapsed = TRUE,
                    width = 12,
                    plotlyOutput("brickyard_temps")
                  ),
                  
                  box(
                    title = "Precip Forecast",
                    collapsible = TRUE,
                    collapsed = TRUE,
                    width = 12,
                    plotlyOutput("brickyard_precip")
                  )
                )
                
              )
      ),
      
      # Second tab content ----
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)







