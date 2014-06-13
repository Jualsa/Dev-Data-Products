shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Miles/(US) gallon prediction"),
    sidebarPanel(
      h4('A simple app to predict Miles/gallon for a car with the selected predictors and values for that predictors, based on mtcars dataset:'),
      h4('1. Select predictors'),
      h4('2. Select values for the predictors'),
      h4('3. Submit and get the prediction results'),
      hr(),
      checkboxGroupInput("checkbox", label = h3("Select Predictors"), 
                         choices = list("Cylinders" = "cyl", "Horsepower" = "hp", "Weight" = "wt")),
      hr(),
      h3('Select Values'),
      numericInput('cr', 'Number of cylinders', 6, min = 4, max = 8, step = 2),
      numericInput('hp', 'Gross horsepower', 200, min = 50, max = 350, step = 5),
      numericInput('wt', 'Weight (lb/1000)', 3, min = 1.5, max = 5.5, step = 0.5),
      hr(),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('Your selected predictors'),
      verbatimTextOutput("predictors"),
      h4('Your selected model'),
      verbatimTextOutput("model"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction")
    )
  )
)