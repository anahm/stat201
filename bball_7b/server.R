library(shiny)
data = read.csv("../bball_7a/nba_sample.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot

  output$distPlot <- renderPlot({
    x    <- data$MIN[data$PTS <= input$points[2] & data$MIN <= input$minutes[2] & data$PTS >= input$points[1] & data$MIN >= input$minutes[1] & data$TOT <= input$rebounds & data$A <= input$assists & data$ST <= input$steals & data$BL <= input$blocks]  # NBA Minute Data
    y    <- data$PTS[data$PTS <= input$points[2] & data$MIN <= input$minutes[2] & data$PTS >= input$points[1] & data$MIN >= input$minutes[1] & data$TOT <= input$rebounds & data$A <= input$assists & data$ST <= input$steals & data$BL <= input$blocks]  # NBA Points Data

    # draw the histogram with the specified number of bins
    plot(x, y, xlab = "Minutes", ylab = "Points")
  })
})

