

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                
                box(
                  title = "Creamery",
                  collapsible = TRUE,
                  width = 11,
                  
                  box(
                    title = "Temps",
                    collapsible = TRUE,
                    collapsed = TRUE,
                    width = 12,
                    plotlyOutput("temps")
                  ),
                  
                  box(
                    title = "Precip",
                    collapsible = TRUE,
                    collapsed = TRUE,
                    width = 12,
                    plotlyOutput("precip")
                  )
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)
