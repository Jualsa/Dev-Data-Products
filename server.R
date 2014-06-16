library(shiny)
library(datasets)
mpgData <- mtcars

shinyServer(function(input, output) {
  Text <- reactive({
    x<-length(input$checkbox)
    if (x==9){"No predictors selected"}
    else if(x==10){paste(input$checkbox[1])}
    else if(x==11){paste(input$checkbox[1],"+",input$checkbox[2])}
    else if(x==12){paste(input$checkbox[1],"+",input$checkbox[2],"+",input$checkbox[3])}
  })
  modelText <- reactive(paste("mpg ~", Text()))
  output$predictors <-renderText({Text()})
  output$model <- renderText({
    if (length(input$checkbox)==9){"No predictors selected"}
    else{modelText()}
  })
  output$prediction <- renderText({
    if (length(input$checkbox)==9){"No predictors selected"}
    else{
      fit<-lm(as.formula(modelText()),data=mtcars)
      c<-input$cr
      h<-input$hp
      w<-input$wt
      df<-data.frame(cyl=c,hp=h,wt=w)
      predict(fit,df) }
  })
}
)