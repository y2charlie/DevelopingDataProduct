library(shiny)
require(markdown)
shinyUI(navbarPage("MPG Model Selector",tabPanel("Plot",
        sidebarPanel(
                radioButtons("Predictor", "Combination of feature vectors:",
             c("cyl + hp + wt + am" = "best",
               "cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb" = "original",
               "cyl + hp + wt" = "no.am"))
                ),
        mainPanel(
                h4("Model Coefficient:"),
                verbatimTextOutput("coef"),
                h4("Adjusted R Square:"),
                verbatimTextOutput("adj.r.squared"),
				h4("Residual Plot:"),
				plotOutput("residualPlot")
                )
        ),
        tabPanel("About",mainPanel(includeMarkdown("ReadMe.md")))
        ))
		
		
