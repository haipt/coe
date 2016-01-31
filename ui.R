library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Singapore Certificate of Entitlement (COE) Prediction"),

    sidebarPanel(
      numericInput('quota', 'COE Quota per bidding', 2000, min = 200, max = 4000, step = 50),
      numericInput('wage', 'National median wage', 4150, min = 3000, max = 5000, step = 100),
      numericInput('sti', 'Straits Times Index (STI)', 2800, min = 1000, max = 5000, step = 100),
      submitButton('Predict')
    ),
    mainPanel(
      h3('Introduction'),
      p("Car price in Singapore is probably the most expensive in the world (a new Toyota Camry can cost up to US$120K in Singapore)."),
      p("Certificate of Entitlement (COE) is a major component contributing to the high car cost."),
      p("In this application we will predict next COE price based on known factors including Supply - Demand (Upcoming COE Quota), purchasing power (National Monthly Median Wage) and Sentiment (current Singapore stock market index STI)."),
      h3('Results of prediction'),
      h4('You entered:'),
      p('COE Quota:'),
      verbatimTextOutput("quota"),
      p('Median Wage:'),
      verbatimTextOutput("wage"),
      p('STI:'),
      verbatimTextOutput("sti"),
      h4('Which resulted in a prediction of COE price to be'),

      verbatimTextOutput("prediction")
    ) )
)
