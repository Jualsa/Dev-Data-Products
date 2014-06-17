library(shiny)
library(datasets)
mpgData <- mtcars

shinyServer(function(input, output) {
  Text <- reactive({
    x<-length(input$chbox)
    if (x==0){"No predictors selected"} 
    else if(x==1){paste(input$chbox[1])} 
    else if(x==2){paste(input$chbox[1],"+",input$chbox[2])} 
    else if(x==3){paste(input$chbox[1],"+",input$chbox[2],"+",input$chbox[3])} 
  })
  modelText <- reactive(paste("mpg ~", Text()))
  output$predictors <-renderText({Text()})
  output$model <- renderText({
    if (length(input$chbox)==0){"No predictors selected"} 
    else{modelText()}
  })
  output$prediction <- renderText({
    if (length(input$chbox)==0){"No predictors selected"} 
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