
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
    titlePanel("Linear Regression With Shiny!"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput('dataset', 'Choose the dataset:',
                  choices = c('Air Quality', 'Cars', 'Earth Quake', 'Swiss')),
      numericInput("obs", "Number of observations to view:", 10),
      checkboxInput('summary','View summary of the dataset'),
      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset."),
      uiOutput('response'),
      checkboxInput("pred_type", 'Wishes to pick the predictors manually?'),
      conditionalPanel(
          condition = "input.pred_type == true",
          uiOutput('predictors')
      ),
      conditionalPanel(
          condition = "input.pred_type == false",
          helpText(" If this is not selected then the linear regression is directly ",
                   "applied on the top predictor")
      ),
      HTML('<hr style="color: purple;" size="20" >')
      , hr(),
      h3('App Overview'),
      p('This is an simple shiny app to illustrate linear Regression on the inbuilt R datasets.
        The App includes 1. AirQuality 2. mtCars 3. Earth Quake and 4. Swiss datasets'
        ),
      h4('Usage:'),
      p('1. Select the dataset of your wish. Default:Airquality'),
      p('2. Choose the number of observations to be viewed from the selected dataset'),
      p('3. Check the box if you wish to see the summary of the dataset'),
      p('4. Choose the response column (y value). Default: first column of the dataset'),
      p('5. If you wish to select the variable predictors variable of your own, select the predictor checkbox. By default the best predictor column of the datset with respect to the respose variable will be taken'),
      p('6. Check the linear model fit for the selected predictors and check the graph of the same'),
      
      hr(),
      hr(),
      h4('Author: Venkadeshwaran K')
    
      ),

    # Show a plot of the generated distribution
    mainPanel(

        h4("Observations"),
        tableOutput("view"),        
        conditionalPanel(
            condition = 'input.summary==true',
            h4("Summary"),
            verbatimTextOutput("summary")
        ),
        h4("Linear regression model fit"),
        verbatimTextOutput('model'),
        plotOutput('plt')
    )
  )
))
