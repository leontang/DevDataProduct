library(shiny)

shinyUI(pageWithSidebar(
  # show webpage header
  headerPanel("Body Mass Index Calculator"),
  
  # show webpage left menu panel
  sidebarPanel(
    h4('This is a simple BMI calculator. The BMI is defined as the body mass 
       divided by the square of the body height, and is universally expressed 
       in units of kg/m2, resulting from mass in kilograms and height in metres.'),
    br(),
    h4('To start, please enter your Height and Weight in the below fields. 
       Click on the submit button once ready and your BMI and BMI Category 
       will be displayed on the right.'),
    br(),
    
    # get user's input on his/her height and weight
    numericInput('height', 'Height (metres):', 1.7, min = 1.0, max = 2.5, step = 0.05),
    numericInput('weight', 'Weight (kilogram):', 60, min = 35, max = 200, step = 1),
    
    # submit button
    submitButton('Submit')
  ),
  
  # show webpage right menu panel
  mainPanel(
    h3('Your Body Mass Index'),
    br(),
    
    # show user's height and weight input
    h4('Your height is:'),
    verbatimTextOutput('height'),
    h4('Your weight is:'),
    verbatimTextOutput('weight'),
    br(),
    
    # show calculated bmi and bmi category based on input height and weight
    h4('Your BMI is:'),
    verbatimTextOutput('bmi'),
    h4('Your BMI category is:'),
    verbatimTextOutput('bmiCat')
  )
))