library(dygraphs)
library(shiny)

# nhtemp is a built-in dataset

# dygraph(nhtemp) %>% 
#   dyRangeSelector()

ui <- fluidPage(
  titlePanel("Average Yearly Temperatures in New Haven"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Start Date"),
      textOutput("start"),
      h3("End Date"),
      textOutput("end")
    ),
    mainPanel(
      dygraphOutput("new_haven")
    )
  )
)

server <- function(input, output){
  output$start <- renderText(input$new_haven_date_window[[1]])
  output$end <- renderText(input$new_haven_date_window[[2]])
  
  output$new_haven <- renderDygraph({
    dygraph(nhtemp) %>%
      dyRangeSelector()
  })
}

shinyApp(ui, server)