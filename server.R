#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#install.packages("ggplot2")
library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output){
    cmovies<-read.csv("cmovies.csv")
    data<-read.csv("data.csv")
    hrs1<-read.csv("hrs1.csv")
    standup<-read.csv("standup.csv")
    standup_frequency<-table(standup$listed_in)
    cmovies<-as.data.frame(cmovies)
   
    abc <- reactive({
        data[data$release.year==input$year,]
          
    })
    
    
    output$q1 <- renderText({ paste("TV-Y7=95 Movies", "TV-Y=117 Movies" ,"TV-G=111 Movies", "PG-13=386 Movies", "PG=247 Movies",sep="\n") })
    output$q2 <- renderText({ "The standup comedy genre has 321 titles." })
    output$q4 <- renderText({ "Highest rated tv show is 13 reasons why.Released in 2017." })
    output$plot1<- renderPlot(width = 500,height = 500, ggplot(cmovies, aes(x="", y=prop, fill=Var1)) +
                                  geom_bar(stat="identity", width=1, color="white") +
                                  coord_polar("y", start=0) +
                                  theme_void() + 
                                  theme(legend.position="none") +
                                  
                                  geom_text(aes(y = ypos, label = Var1), color = "white", size=6) +
                                  scale_fill_brewer(palette="Set1")
    )  
    
    output$plot2 <- renderPlot(width = 500, height = 500,
                               
                               barplot(standup_frequency,ylab = "Genres",xlab = "No. of titles",horiz = TRUE,col = c("cyan"))
                               
    )
    output$plot3 <- renderPlot(width = 500, height = 500,
                               
                               ggplot(abc(), aes(x=title, y=user.rating.score)) +
                                   geom_segment( aes(x=title, xend=title, y=0, yend=user.rating.score), color="skyblue") +
                                   geom_point( color="blue", size=4, alpha=0.6) +
                                   theme_light() +
                                   coord_flip() +
                                   theme(
                                       panel.grid.major.y = element_blank(),
                                       panel.border = element_blank(),
                                       axis.ticks.y = element_blank()
                                   )
                               
    )
    output$plot4 <- renderPlot(width = 1000, height = 600,
                               
                               
                               ggplot(hrs1,aes(x=title, y=release.year, size=user.rating.score, color=title)) +
                                   geom_point(alpha=0.5) +
                                   scale_size(range = c(.1, 24), name="Rating")
                               
    )
    
})