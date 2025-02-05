library(shiny)

ui <- fluidPage(
  titlePanel("Mon Premier Shiny - Choix de Couleur et Style"),
  sidebarLayout(
    sidebarPanel(
      selectInput("couleur", "Choisissez une couleur :", 
                  choices = c("Rouge" = "red", "Bleu" = "lightblue", "Vert" = "lightgreen", "Orange" = "darkorange", "Violet" = "purple")),
      selectInput("style", "Choisissez un style de points :", 
                  choices = c("Rond" = 19, "Carré" = 15, "Triangle" = 17, "Croix"= 4))
    ),
    mainPanel(
      plotOutput("monPlot")
    )
  )
)

