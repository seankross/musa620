# ---- app3-server ----

library(shiny)

function(input, output){
  output$starfish <- renderText(input$slider1)
}