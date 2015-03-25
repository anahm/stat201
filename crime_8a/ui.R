library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Crime Data"),

  # Sidebar with textbox and a bunch ofslider inputs
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("weapon", "Weapon Type:",
                         c("Shotgun" = "Shotgun",
                           "Handgun" = "Handgun",
                           "Rifle" = "Rifle",
                           "Blunt Object" = "Blunt Object",
                           "Knife" = "Knife",
                           "Personal Weapon" = "Personal Weapon",
                           "Strangulation" = "Strangulation",
                           "Unknown" = "Unknown",
                           "Firearm" = "Firearm",
                           "Drowning" = "Drowning",
                           "Fire" = "Fire",
                           "Explosives" = "Explosives",
                           "Asphyxiation" = "Asphyxiation",
                           "Drugs" = "Drugs",
                           "Other Gun" = "Other Gun",
                           "Poison" = "Poison",
                           "Pushed out Window" = "Pushed out Window"),
                         selected = c("Shotgun","Handgun",
                           "Rifle","Blunt Object","Knife","Personal Weapon","Strangulation",
                           "Unknown","Firearm","Drowning","Fire","Explosives","Asphyxiation",
                           "Drugs","Other Gun","Poison","Pushed out Window"))
    , width = 2),

    # Show a plot of the generated distribution
    mainPanel(
      fluidRow(
        column(6,
               plotOutput("a_distPlot", height = "600px")
        ),
        column(6,
               plotOutput("b_distPlot", height = "600px")
        )
    )
  )
)))

