library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Confidence Intervals in Detail"),

  tabsetPanel(position='above',
    tabPanel('Confidence Intervals',
             checkboxGroupInput("Attribute", "Attribute:",
                                c("Influence" = "Influence",
                                  "Susceptibility" = "Susceptibility")),
             selectInput("Cat", "Choose your Category:", choices = 
                           c('Age'='age',
                             'Gender'='gender', 
                             'Relationship'='relationship')),
             conditionalPanel(
               condition = "input.Cat == 'age'",
               checkboxGroupInput("Ages", "Ages:",
                                  c("Age (0-18)" = "Age (0-18)",
                                    "Age (18-23)" = "Age (18-23)",
                                    "Age (23-31)" = "Age (23-31)",
                                    "Age (31+)" = "Age (31+)"))),
             conditionalPanel(
               condition = "input.Cat == 'gender'",
               checkboxGroupInput("Gender", "Gender:",
                                  c("Male" = "Male",
                                    "Female" = "Female"))),
             conditionalPanel(
               condition = "input.Cat == 'relationship'",
               checkboxGroupInput("Relationship", "Relationship:",
                                  c("Single" = "Single",
                                    "Relationship" = "Relationship",
                                    "Engaged" = "Engaged",
                                    "Married" = "Married",
                                    "Complicated" = "Complicated"))),
             width = 2),
      mainPanel(
        tags$style(type="text/css",
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"),
        # TODO: insert confidence interval stuff here
        plotOutput("ci_plot")
      )
    )
))

