library(shiny)

data = read.csv("nba_sample.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    subset_data <- subset(data, PTS <= input$points[2] & PTS >= input$points[1])

    hist(subset_data$PTS, breaks=input$bins, col = '#028482', border = 'white',
      xlab="Minutes Played", ylab="Game + Player Occurrence",
      main="Frequency of Minutes Played By Players in Games")
  })
})


