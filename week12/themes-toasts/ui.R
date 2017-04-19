library(shiny)
library(shinythemes)
library(shinytoastr)

navbarPage("Cinnamon",
  #shinythemes::themeSelector(),
  theme = shinythemes::shinytheme("cosmo"),
  useToastr(),
  tabPanel("Toast",
    sidebarLayout(
      sidebarPanel(
        actionButton("success", "Green Toast"),
        actionButton("warning", "Yellow Toast"),
        actionButton("error", "Red Toast")
      ),
      mainPanel(
        
      )
    )
  ),
  tabPanel("Crunch", includeMarkdown("crunch.md")),
  selected = "Crunch"
)