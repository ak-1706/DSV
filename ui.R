#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#install.packages("shinydashboard")
library(shiny)
library(shinydashboard)
dashboardPage(
    dashboardHeader(title = "Netflix dataset"),
    dashboardSidebar(sidebarMenu(
        menuItem("Children Movies", tabName = "Question1"),
        menuItem("Standup Comedies", tabName = "Question2"),
        menuItem("Most Watched Shows", tabName = "Question3"),
        menuItem("Highest rated Show", tabName = "Question4")
    )
    ),
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "Question1",
                    fluidRow(
                        box(plotOutput("plot1", height = 250),height = 600),
                        
                        
                    ),
                    fluidRow(
                        box(title = "Info",
                            verbatimTextOutput("q1")
                        )
                    )
            ),
            
            # Second tab content
            tabItem(tabName = "Question2",
                    # h2("Widgets tab content2")
                    fluidRow(
                        box(plotOutput("plot2", height = 250),height = 600),
                        
                        
                    ),
                    fluidRow(
                        box(
                            title = "Info",
                            verbatimTextOutput("q2")
                        )
                    )
            ),
            # Third tab content
            tabItem(tabName = "Question3",
                    fluidRow(
                        box(plotOutput("plot3", height = 250),height = 600),
                        
                        
                    ),
                    fluidRow(
                        
                        column(6,
                               numericInput("year", "Enter any year from 1940 to 2017", value = 0, min = 0, max = 2017),
                        )
                        
                    )
            ),
            # Fourth tab content
            tabItem(tabName = "Question4",
                    fluidRow(
                        box(plotOutput("plot4", height = 600,width = 600),height = 700,width = 800),
                        
                        
                    ),
                    fluidRow(
                        box(
                            title = "Info",
                            verbatimTextOutput("q4")
                        )
                    )
            )
            
        )
    )
    
)
