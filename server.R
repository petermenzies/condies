

server <- function(input, output) {
  
  
  output$creamery_temps <- renderPlotly(
    ggplotly(
      creamery_temps_plot
    )
  )
  
  output$creamery_precip <- renderPlotly(
    ggplotly(
      creamery_precip_plot
    )
  )
  
  output$brickyard_temps <- renderPlotly(
    ggplotly(
      brickyard_temps_plot
    )
  )
  
  output$brickyard_precip <- renderPlotly(
    ggplotly(
      brickyard_precip_plot
    )
  )
  
  
}




