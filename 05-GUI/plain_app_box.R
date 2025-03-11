# Global variables can go here
box::use(
  shiny,
)

n <- 200

# Define the UI
ui <- shiny$bootstrapPage(
  shiny$numericInput("n", "Number of obs", n),
  shiny$plotOutput("plot")
)

# Define the server code
server <- function(input, output) {
  output$plot <- shiny$renderPlot({
    hist(runif(input$n))
  })
}

# Return a Shiny app object
shiny$shinyApp(ui = ui, server = server)
