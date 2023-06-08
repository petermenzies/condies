

server <- function(input, output) {
  
  
  output$precip <- renderPlotly(
    ggplotly(
      make_precip_plot(
        get_forecast_clean(brickyard)
      )
    )
  )
  
  output$temps <- renderPlotly(
    ggplotly(
      make_temps_plot(
        get_forecast_clean(brickyard)
      )
    )
  )
  
  
}