library(shiny)
library(ggplot2)
library(ggmap)
library(magrittr)

function(input, output){
  
  make_map <- reactive({
    us <- c(left = input$left, bottom = input$bottom, 
            right = input$right, top = input$top)
    map <- get_stamenmap(us, zoom = input$zoom, maptype = "toner-lite")
    ggmap(map)
  })
  
  output$map <- renderPlot({
    make_map()
  })
  
  output$dl <- downloadHandler(
    filename = function(){"map.png"},
    content = function(temp){
      ggsave(temp, plot = make_map(), device = "png")
    }
  )
}
