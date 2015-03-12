library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("NBA Basketball Player Analysis"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("points",
                  "Number of points:",
                  min = 1,
                  max = 51,
                  value = c(1,51)),
      sliderInput("bins",
                  "Number of bins:",
                  min = 0,
                  max = 50,
                  value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

