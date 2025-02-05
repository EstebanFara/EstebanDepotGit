library(shiny)

server <- function(input, output) {
  output$monPlot <- renderPlot({
    plot(1:10, 1:10, col = input$couleur, pch = as.numeric(input$style), cex = 2,
         main = "Graphique de base",
         xlab = "X", ylab = "Y")
  })
}
