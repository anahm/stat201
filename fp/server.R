library(shiny)
library(ggplot2)

require(ggplot2)
require(scales)

data = read.csv("data.csv")
influence = data[data$Category == "Influence",]
suscept = data[data$Category == "Susceptibility",]
both = data

shinyServer(function(input, output) {

  output$ci_plot <- renderPlot({
    if(length(input$Attribute) != 0)
    {
      if(length(input$Attribute) == 2)
      {
        use1 = both
      }
      else
      {
        print(input$Attribute)
        if(input$Attribute[1] == "Susceptibility")
        {
          use1 = suscept
        }
        else
        {
          use1 = influence
        }
      }
    }
    else
    {
      use1 = c()
    }
    
    if(input$Cat == "age")
    {
      use2 = use1[use1$X %in% input$Ages,]
    }
    else
    {
      if(input$Cat == "gender")
      {
        use2 = use1[use1$X %in% input$Gender,]
      }
      else
      {
        use2 = use1[use1$X %in% input$Relationship,]
      }
    }
    
    p <- ggplot(use2, aes(x=X, ymin=`X5`, lower=`X25`, middle=`X50`, 
                          upper=`X75`, ymax=`X95`)) 
    p <- p + geom_boxplot(aes(fill=Category), stat = "identity")
    p <- p + facet_wrap( ~ X, scales="free_x", nrow =1)
    p <- p + xlab("Category") + ylab("Hazard")
    p
    
    
    
    
#    # subset the data
#    subset.data <- subset(data, WEAPON %in% input$weapon)
#
#    p <- ggplot(data=subset.data) +
#      geom_histogram(aes(x=YEAR))
#    print(p)
#
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
#
  })

})
