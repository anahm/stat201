library(shiny)
library(ggplot2)

data = read.csv("nba_sample.csv")


shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    # subset the data
    subset.data <- subset(data, data$PTS <= input$points[2] &
      data$MIN <= input$minutes[2] & data$PTS >= input$points[1] &
      data$MIN >= input$minutes[1] & data$TOT <= input$rebounds &
      data$A <= input$assists & data$ST <= input$steals &
      data$BL <= input$blocks)

    # pick player data we want to highlight
    subset.data$highlight <- ifelse(subset.data$PLAYER == input$player,
      "highlight", "normal")
    colors <- c("highlight" = "red", "normal" = "black")

    # plot scatter plot of min vs. pts
    p <- ggplot(data=subset.data, aes(x=MIN, y=PTS, col=highlight)) +
      geom_point() +
      geom_hline(yintercept=mean(data$PTS), alpha=0.4) +
      geom_vline(xintercept=mean(data$MIN), alpha=0.4) +
      scale_color_manual("Player Legend", values=colors,
        labels=c(input$player, "Rest of Players")) +
      xlab('Minutes Played Per Game') +
      ylab('Points Scored Per Game') +
      ggtitle('Points vs. Minutes For Each Player\'s Game Appearance')

    print(p)


  })
})

