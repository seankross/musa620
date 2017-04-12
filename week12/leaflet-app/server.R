library(shiny)
library(leaflet)

lat <- NULL
lng <- NULL
notes <- NULL

function(input, output) {
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lat = 39.9494666, lng = -75.199356, zoom = 13)
  })
  
  output$download <- downloadHandler(
    filename = function() {
      paste0("upenn-", Sys.Date(), ".csv")
    },
    content = function(temp) {
      write.csv(data.frame(lat = lat, lng = lng, notes = notes), temp)
    }
  )
  
  observe({
    
    if(!is.null(input$map_click$lat)){
      leafletProxy("map") %>%
        addMarkers(lat = input$map_click$lat, 
                   lng = input$map_click$lng, 
                   popup = input$popup)
      lat <<- c(lat, input$map_click$lat)
      lng <<- c(lng, input$map_click$lng)
      notes <<- c(notes, input$popup)
    }
    
  })
}

