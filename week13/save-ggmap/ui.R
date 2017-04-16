library(shiny)

fluidPage(
  titlePanel("Simple ggmap"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("left", "Left", -125),
      numericInput("bottom", "Bottom", 25.75),
      numericInput("right", "Right", -67),
      numericInput("top", "Top", 49),
      numericInput("zoom", "Zoom", 5),
      submitButton("Create Map"),
      br(),
      downloadButton("dl", "Download Map")
    ),
    mainPanel(
      plotOutput("map")
    )
  )
)
