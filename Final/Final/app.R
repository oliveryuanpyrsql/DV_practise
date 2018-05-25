##############################################
# Final Shiny App
# Oliver
################################################################################
library(tidyverse)
library(ggvis)
library(igraph)
library(scales)
library(shiny)
se <- function(x){ sqrt(var(x, na.rm=T)/length(x))}
listingsAll <- read.csv("dc_listings_exam.csv")
P3 <- listingsAll %>% 
  select(id, neighbourhood_cleansed, property_type, room_type, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value) %>% 
  group_by(property_type) %>% 
  summarise(avg_rate = mean(review_scores_rating, na.rm = T), avg_accuracy = mean(review_scores_accuracy, na.rm= T), avg_clean = mean(review_scores_cleanliness, na.rm = T), avg_check = mean(review_scores_checkin, na.rm = T), avg_communication = mean(review_scores_communication, na.rm = T), avg_location = mean(review_scores_location, na.rm = T), avg_value = mean(review_scores_value, na.rm = T)) %>%
  filter(avg_rate != "NaN")
################################################################################
ui <- fluidPage(
  titlePanel("Final: Review Comparison"),

    sidebarPanel(
      selectInput("yreview", "Review Rate to Compare", choices = names(P3[2:8]), selected = "avg_rate"),
      actionButton("go","Go")
    ), 
    mainPanel(
      plotOutput("rateplot"),
      textOutput("insight")
    )
  
  
)
################################################################################

server <- function(input, output) {
  
  plotData <- eventReactive(input$go,{
    
    cbind.data.frame(x = P3$property_type, y = P3[,input$yreview]) %>% 
      arrange(desc(y)) %>% 
      head(10)
    
  })
  
  output$rateplot <- renderPlot({
    ggplot(plotData()) +
      geom_bar(mapping = aes(x = reorder(x, -y), y = y), stat = "identity", fill = "#FD5C63")+
      xlab("Property Type")+
      ylab("Review Rate")+
      ggtitle(" The Most Top 10 Desired Property Types")+
      theme(axis.text.x = element_text(angle = -45, hjust = -0.05))
    
  })
  output$insight <- renderText({
    
    "By switching between y variables we can see that treehouse and castle are always the top 2 choice. Surprisingly, boat is always onr of top 10 choices."
  })
}

shinyApp(ui = ui, server = server)

