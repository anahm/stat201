library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Basketball Analysis"),

  # Sidebar with textbox and a bunch ofslider inputs
  sidebarLayout(
    sidebarPanel(
      textInput("player", "Insert Player Name: "),
      sliderInput("points",
                  "Number of points:",
                  min = 1,
                  max = 51,
                  value = c(1,51),
                  step = 1),
      sliderInput("minutes",
                  "Number of minutes:",
                  min = 0,
                  max = 49,
                  value = c(0,49)),
      sliderInput("rebounds",
                  "Number of rebounds:",
                  min = 0,
                  max = 26,
                  value = 26),
      sliderInput("assists",
                  "Number of assists:",
                  min = 0,
                  max = 15,
                  value = 15),
      sliderInput("steals",
                  "Number of steals:",
                  min = 0,
                  max = 7,
                  value = 7),
      sliderInput("blocks",
                  "Number of blocks:",
                  min = 0,
                  max = 8,
                  value = 8)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

