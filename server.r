# Define server logic required to draw a histogram
library(shiny)
library(shinydashboard)
library(plotly)

shinyServer(function(input, output) {
  
  output$poliwag <- renderPlot({
    
    g <- ggplot(AppleStor, aes(prime_genre))
    g + geom_bar(aes(fill=cont_rating), width = 0.5) + 
      theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
      labs(title="Per Genre", 
           subtitle="Apple Store Applications (Mobile)") + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1)) +labs(x = "Genre of Mobile Application", 
    y = NULL, fill = "Content Rating")
    
  })
  
  output$pika <- renderPlot({
  # Created Interactive Plot that will allow the user to show the  

  AppleStor %>%
    filter(., prime_genre == input$AppleStor) %>% 
    ggplot(., aes(x=user_rating, y=cont_rating)) +
    geom_point( position = 'jitter') +
    labs(ggtitle("User Rating Per Genre", subtitle = NULL),
         xlab('User Ratings'), ylab('Content Ratings')) + theme(plot.subtitle = element_text(vjust = 1), 
                                                                plot.caption = element_text(vjust = 1)) +labs(x = "User Rating", y = "Content Rating", 
                                                                                                              colour = "Genre of App")
  })
  
    output$squirtle <- renderPlot({
      AppleStor %>% 
        filter(., prime_genre %in% c("Productivity","Business", "Games", "Sports", "Health & Fitness")) %>%
        ggplot(., aes(x=sup_devices.num, y=user_rating)) +
        geom_point(aes(color = prime_genre), position = 'jitter') +
        labs(ggtitle("User Rating Per Devices Supported", subtitle = NULL), 
             xlab("# of Supported Devices"), ylab("User Ratings")) + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1)) +labs(x = "# of Supported Devices", y = "User Rating", 
    colour = "Genre of App")
    })
      
    output$metapod <- renderPlot({
      
      AppleStor %>% 
        filter(., prime_genre %in% c("Utilities","Reference","Weather", "Catalogs", "Navigations", "Travels")) %>%
        ggplot(., aes(x=sup_devices.num, y=user_rating)) +
        geom_point(aes(color = prime_genre), position = 'jitter') +
        labs(ggtitle("User Rating Per Devices Supported", subtitle = NULL),
             xlab("# of Supported Devices"), ylab("User Ratings")) + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1)) +labs(x = "# of Support Devices ", y = "User Rating ", 
    colour = "Genre of App")
    })
    output$paras <- renderPlot({
      
      AppleStor %>% 
        filter(., prime_genre %in% c("Education","Lifestyle","News", "Medical", "Food & Drink", "Book")) %>%
        ggplot(., aes(x=sup_devices.num, y=user_rating)) +
        geom_point(aes(color = prime_genre), position = 'jitter') +
        labs(ggtitle("User Rating Per Devices Supported", subtitle = NULL),
             xlab("# of Supported Devices"), ylab("User Ratings")) + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1)) +labs(x = "# of Support Devices ", y = "User Rating ", 
    colour = "Genre of App")
    })
    output$diglett <- renderPlot({
      
      AppleStor %>% 
        filter(., prime_genre %in% c("Shopping","Finance","Entertainment", "Music", "Photo & Video", "Social Networking")) %>%
        ggplot(., aes(x=sup_devices.num, y=user_rating)) +
        geom_point(aes(color = prime_genre), position = 'jitter') +
        labs(ggtitle("User Rating Per Devices Supported", subtitle = NULL),
             xlab("# of Supported Devices"), ylab("User Ratings")) + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1)) + labs(x = "# of Supported Devices", y = "User Rating", 
    colour = "Genre of Apps ")
    })
    
    output$raichu <- renderPlot({ 
      emoji2 %>% 
        group_by(., Occurrences, Char, Sentiment.score) %>% 
        filter(.,Occurrences == input$emoji2 , Sentiment.score == input$emoji3) %>%
        ggplot(., aes(Occurrences, Sentiment.score)) + geom_boxplot() + theme(plot.subtitle = element_text(vjust = 1), 
                                                                              plot.caption = element_text(vjust = 1)) + labs(x = "Occurrences of Emojis", y = "Sentiment Score", 
                                                                                                                             colour = "Emoji")
        
      
      })
    
})





