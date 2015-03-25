library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Crime Data"),

  # Sidebar with textbox and a bunch ofslider inputs
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("weapon", "Weapon Type:",
                         c("Shotgun" = "shotgun",
                           "Handgun" = "handgun",
                           "Rifle" = "rifle",
                           "Blunt Object" = "blunt",
                           "Knife" = "knife",
                           "Personal Weapon" = "personal",
                           "Strangulation" = "strang",
                           "Unknown" = "unknown",
                           "Firearm" = "firearm",
                           "Drowning" = "drown",
                           "Fire" = "fire",
                           "Explosives" = "explo",
                           "Asphyxiation" = "asp",
                           "Drugs" = "drugs",
                           "Other Gun" = "other",
                           "Poison" = "poison",
                           "Pushed out Window" = "window"),
                         selected = c("Shotgun","Handgun",
                           "Rifle","Blunt Object","Knife","Personal Weapon","Strangulation",
                           "Unknown","Firearm","Drowning","Fire","Explosives","Asphyxiation",
                           "Drugs","Other Gun","Poison","Pushed out Window"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))

