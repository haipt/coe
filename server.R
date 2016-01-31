library(shiny)
library(randomForest)

#Train the model first
merged <- read.csv('merged.csv')
model <- randomForest(Quota.Premium ~ Salary + Quota + Open, data = merged)

coePredict <- function(quota, wage, sti) {
  df <- data.frame(Quota = quota, Salary = wage, Open = sti)
  prediction = predict(model, newdata = df)
  (prediction)
}

shinyServer(
function(input, output) {
  wage <- reactive({as.numeric(input$wage)})
  quota <- reactive({as.numeric(input$quota)})
  sti <- reactive({as.numeric(input$sti)})
  output$quota = renderPrint({quota()})
  output$wage = renderPrint({wage()})
  output$sti = renderPrint({sti()})
  output$test = renderPrint({data.frame(Salary = {wage()}, Quota = {quota()}, Open = {sti()})})
  output$prediction = renderPrint({ coePredict(quota(), wage(), sti()) })
  #df = data.frame(Salary = {wage()}, Quota = {quota()}, Open = {sti()})
  #output$prediction <- predict(model, new_data = df)
} )
