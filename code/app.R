library(plotly)
library(shiny)
library(googleVis)
library(shiny)

library(shiny)

ui <- fluidPage(
  titlePanel("Body Fat Percentage Estimator"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("unit", "Measurement Unit:", choices = c("cm", "inches"), selected = "cm"),
      numericInput("abdomen", "Enter Abdomen Circumference:", value = 80, min = 0, max = 150, step = 0.01),
      numericInput("wrist", "Enter Wrist Circumference:", value = 18, min = 0, max = 30, step = 0.01),
      actionButton("calculate", "Calculate"),
      verbatimTextOutput("warningText"), # Output for warnings
      
      # Divider
      tags$hr(),
      
      # Contact Information
      h4("Application Developed and Maintained by:"),
      tags$p("Name: Kai Shukla, Abigail Sikora & Yeming Wei"),
      tags$p("Email: kshukla2@wisc.edu"),
    ),
    
    mainPanel(
      htmlOutput("fatPlot"),
      div(style = "font-size: 20px;", textOutput("resultText"))
    )
  )
)


server <- function(input, output) {
  
  # Initial gauge
  output$fatPlot <- renderGvis({
    create_gauge(15) # initial value
  })
  
  observeEvent(input$calculate, {
    
    # Validation for positive values
    if(input$abdomen <= 0 || input$wrist <= 0) {
      output$warningText <- renderText({
        return("Please enter positive values for measurements!")
      })
      return() # Exit without further processing
    } else {
      output$warningText <- renderText({ "" }) # Reset warning text
    }
    
    if(input$unit == "inches") {
      abdomen_cm <- input$abdomen * 2.54
      wrist_cm <- input$wrist * 2.54
    } else {
      abdomen_cm <- input$abdomen
      wrist_cm <- input$wrist
    }
    
    predicted_fat <- 0.7132 * abdomen_cm - 2.0181 * wrist_cm - 10.1784
    predicted_fat <- max(3, min(60, predicted_fat)) # Ensuring value is between 3 and 60
    
    output$fatPlot <- renderGvis({
      create_gauge(predicted_fat)
    })
    
    # Display message based on predicted fat percentage
    output$resultText <- renderText({
      if(predicted_fat >= 3 && predicted_fat < 5) {
        return("Essential fat range: 3-5%.")
      } else if(predicted_fat >= 5 && predicted_fat < 14) {
        return("Athlete's range: 5-13%.")
      } else if(predicted_fat >= 14 && predicted_fat < 18) {
        return("Fitness range: 14-17%.")
      } else if(predicted_fat >= 18 && predicted_fat < 25) {
        return("Acceptable range: 18-24%.")
      } else {
        return("Obesity range: >25%.")
      }
    })
  })
}

create_gauge <- function(value) {
  m1 <- data.frame(Label="Fat %", Value=value)
  
  Gauge <- gvisGauge(m1, 
                     options=list(min=3, max=60, 
                                  greenFrom=3, greenTo=25,
                                  yellowFrom=25, yellowTo=35,
                                  redFrom=35, redTo=60, 
                                  width=500, height=500, fontSize = 12))
  
  return(Gauge)
}
shinyApp(ui = ui, server = server)
