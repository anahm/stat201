library(shiny)
library(ggplot2)

require(foreign)

data = read.dta("crime.dta")
names(data)
data = subset(data, VICAGE < 99)
data = subset(data, OFFAGE < 99)

shinyServer(function(input, output) {

  output$b_distPlot <- renderPlot({
    # subset the data
     subset.data <- subset(data, WEAPON %in% input$weapon)
     
     
    p <- ggplot(data=subset.data) +
      geom_histogram(aes(x=YEAR))
    print(p)
    
    
 
#     # pick player data we want to highlight
#     subset.data$highlight <- ifelse(subset.data$PLAYER == input$player,
#       "highlight", "normal")
#     colors <- c("highlight" = "red", "normal" = "black")
# 
#     # plot scatter plot of min vs. pts
#     p <- ggplot(data=subset.data, aes(x=MIN, y=PTS, col=highlight)) +
#       geom_point() +
#       geom_hline(yintercept=mean(data$PTS), alpha=0.4) +
#       geom_vline(xintercept=mean(data$MIN), alpha=0.4) +
#       scale_color_manual("Player Legend", values=colors,
#         labels=c(input$player, "Rest of Players")) +
#       xlab('Minutes Played Per Game') +
#       ylab('Points Scored Per Game') +
#       ggtitle('Points vs. Minutes For Each Player\'s Game Appearance')
# 
#     print(p)

  })

output$a_distPlot <- renderPlot({
  # subset the data
  subset.data <- subset(data, WEAPON %in% input$weapon)
  
  
  q <- ggplot(data=subset.data) +
    geom_point(aes(x=VICAGE, y = OFFAGE), alpha = 0.3)
  print(q)
  
})

})
