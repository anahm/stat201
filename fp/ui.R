library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Alex is OK"),

  tabsetPanel(position='below',
    tabPanel('Confidence Intervals',
      mainPanel(
        # TODO: insert confidence interval stuff here
      )
    ),

    tabPanel('Heat Map',
      # Sidebar with textbox and a bunch ofslider input
      # TODO: how come the side bar is above the tabpanel?
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
        mainPanel()
      )
    )
  )
))

