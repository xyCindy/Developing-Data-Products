# Week 1 quiz
# Question 1
library(manipulate)
myPlot <- function(s) {
        plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
        abline(0, s)
}
manipulate(myPlot(s), s = slider(0, 2, step = 0.1))

# Question 2
dTable(airquality, sPaginationType = "full_numbers")

# Question 3
# A basic shiny data product requires:
#---A ui.R and server.R file or a A server.R file and a directory called
#---www containing the relevant html files.

# Question 4
# library(shiny)
# shinyUI(pageWithSidebar(
#         headerPanel("Data science FTW!"),
#         sidebarPanel(
#                 h2('Big text')
#                 h3('Sidebar')
#         ),
#         mainPanel(
#                 h3('Main Panel text')
#         )
# ))
# ---Missing a comma in the sidebar panel

# Question 5
# Consider the following code in ui.R
shinyUI(pageWithSidebar(
        headerPanel("Example plot"),
        sidebarPanel(
                sliderInput('mu', 'Guess at the mu',value = 70, 
                            min = 60, max = 80, step = 0.05,)
        ),
        mainPanel(
                plotOutput('newHist')
        )
))
# And the following server.R code.
library(UsingR)
data(galton)

shinyServer(
        function(input, output) {
                output$myHist <- renderPlot({
                        hist(galton$child, xlab='child height', col='lightblue',
                             main='Histogram')
                        mu <- input$mu
                        lines(c(mu, mu), c(0, 200),col="red",lwd=5)
                        mse <- mean((galton$child - mu)^2)
                        text(63, 150, paste("mu = ", mu))
                        text(63, 140, paste("MSE = ", round(mse, 2)))
                })
                
        }
)
# ---In ui.R, output name is 'newHist'
# ---In server.R, output name is 'myHist'
# ---The server.R output name isn't the same as the plotOutput command used 
# ---in ui.R.