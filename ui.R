
library(shiny)
library(wordcloud)
library(corrplot)
library(dplyr)
library(tidyverse)
library(shinydashboard)
library(plotly)



shinyUI(
  dashboardPage( skin = "yellow", # made the header yellow, the blue was ugly
    dashboardHeader( title = "UX Research Methods and Visualizing App User Ratings", 
                     titleWidth = 525), #trying to make the title fit on the screen 
    dashboardSidebar(
      width = 275, #Needed to fit all the sub menu items on the sidebar
      sidebarMenu(
      menuItem('Per Genre', tabName = "genre", icon = icon("th")), 
        menuSubItem('Genres User Ratings', tabName = "userRa"),
      menuItem('Supported Devices and Content Rating', tabName = "supp", icon = icon("th")),
      menuItem('Expression with Emojis', tabName = "emoji", icon = icon("th"))
    )),
#dashboard creatiion is here    
    dashboardBody(
      tabItems( tabItem( tabName = "genre", 
                         fluidRow(
                           # creating a bar graph with the amount of different types of apps
                           (plotOutput("poliwag", width = "100%", height = "550px"))
                         )),
#Genre's using user rating visuals       
      tabItem(tabName = "userRa",
        fluidPage(
            titlePanel('User Rating Per Genre'),
            sidebarLayout(
              sidebarPanel(
              helpText('Use the drop down boxes for find the User ratings for any Genre of Applications'),
              selectInput("AppleStor", "SUPER AWESOME",
              choices = c("Games", "Productivity", "Weather", "Book", "Shopping", "Food & Drink", 
              "Medical", "News", "Lifestyle", "Education", "Photo & Video","Entertainment", "Music",
              "Navigation","Travel","Catalogs","Reference","Utilities", "Health & Fitness","Sports", 
              "Business", "Finance", "Productivity"),
              selected = "Games")
              
                                       ),
              mainPanel(plotOutput("pika", width = "100%", height = "750px")))
      )),
    
#creating another scatter plot to visualize the user-rating compared to how many devices can handle the app 
      
        tabItem(tabName = "supp",
                fluidRow(
                  (plotOutput("squirtle", width = "100%", height = "400px")),
                  (plotOutput("metapod", width = "100%", height = "400px")),
                  (plotOutput("paras", width = "100%", height = "400px")),
                  (plotOutput("diglett", width = "100%", height = "400px"))
                )),
        tabItem(tabName = "emoji",
                fluidPage(
                  titlePanel('Emoji and User Sentiment/Emotions'),
                  sidebarLayout(
                    sidebarPanel(
                      helpText('Use the Sliders to look at the Sentiment Values of Emojis'),
                      sliderInput("emoji2", "Sentiment Score",
                                  min = 1, max = 411, step = 1, 
                                  value = "-0.146"),
                      animationOptions(interval = 1000),
                      sliderInput("emoji3", "# of Occurences",
                                  min = 1, max = 260,
                                  value = "247"),
                      animationOptions(interval = 1000)
                    ),
                    mainPanel(plotOutput("raichu", width = "100%", height = "750px")))
                ))
        
        ))

))

      
  



