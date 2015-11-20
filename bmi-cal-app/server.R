library(shiny)

# function for calculating bmi based on input height and weight
calculateBmi <- function(height, weight) {
  weight / (height * height)
}

# function for determing the bmi category based on the input bmi
bmiCategory <- function(bmi) {
  if (bmi < 18.5) {
    "Underweight"
  } else if (bmi < 22.9) {
    "Normal Range"
  } else if (bmi < 24.9) {
    "Overweight - At Risk"
  } else if (bmi < 29.9) {
    "Overweight - Moderately Obese"
  } else {
    "Overweight - Severely Obese"
  }
}

shinyServer(
  function(input, output) {
    # renders the input parameters to output for display to user
    output$height <- renderPrint({input$height})
    output$weight <- renderPrint({input$weight})
    
    # renders the calculated bmi and bmi category to output for display to user
    output$bmi <- renderPrint({calculateBmi(input$height, input$weight)})
    output$bmiCat <- renderPrint({bmiCategory(calculateBmi(input$height, input$weight))})
  }
)