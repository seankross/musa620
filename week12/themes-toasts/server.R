library(shiny)

function(input, output) {
  
  observeEvent(input$success,
    toastr_success("You have succeeded!")
  )
  
  observeEvent(input$warning,
    toastr_warning("Now I should warn you...")
  )
  
  observeEvent(input$error,
    toastr_error("Something has gone wrong.")
  )
}