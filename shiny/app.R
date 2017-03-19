#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
mtcars <- mtcars

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Lookup"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textAreaInput("caption", "Gamintojo kodas", "Data Summary", width = "200px", height = "600px"),
      submitButton("Update View", icon("refresh"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("table")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  data <- reactive( {as.data.frame(strsplit(input$caption, "\n"), col.names = names('kodas'))} )
  
  
  output$table <- renderTable({ head( data() )},  
                              striped = TRUE, bordered = TRUE,  
                              align = 'l',
                              na = 'missing')
  
}

# Run the application 
shinyApp(ui = ui, server = server)
