library(shiny)
library(leaflet)

navbarPage("Leaflet + Shiny",
  tabPanel("Map",
    sidebarLayout(
      sidebarPanel(
        textInput("popup", "Add Notes"),
        downloadButton("download", "Download Lat/Long Data")
      ),
      mainPanel(
        leafletOutput("map")
      )
    )
    
  )
)