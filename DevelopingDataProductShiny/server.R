library(shiny)

buildModel <- function(input)
{
	data(mtcars)
	if(input == "best")
		lm(mpg ~ cyl + hp + wt + am, data=mtcars)
	else if(input == "original")
		lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data=mtcars)
	else if(input == "no.am")
		lm(mpg ~ cyl + hp + wt, data=mtcars)
}

shinyServer(
        function(input, output)
        {
				model <- reactive({buildModel(input$Predictor)})
                output$coef <- renderPrint({summary(model())$coef})
                output$adj.r.squared <- renderPrint({summary(model())$adj.r.squared})
				output$residualPlot <- renderPlot(
				{
					par(mfrow = c(2, 2)) 
					plot(model())
				}
				)
        })