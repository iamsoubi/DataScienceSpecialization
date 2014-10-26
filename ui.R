
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny) 
shinyUI(
        fluidPage(
                # Application title
             titlePanel("Calculation of BMI(Body Mass Indicator)"),
           
                sidebarPanel(
                        numericInput('weight', 'Please put your Weight in KG', 65) ,
                        numericInput('height', 'Please put your Height in Meter', 1.65, min = 0.01, max = 5, step = 0.01),
                        submitButton('Submit')
              
                ), 
                mainPanel(
                        p('Body Mass Index (BMI) is a simple index of weight-for-height that is commonly used to classify underweight, overweight and obesity in adults.'),
                        p('The International Classification of adult underweight, overweight and obesity according to BMI:'),
                        tags$div(
                                tags$ul(
                                        tags$li('BMI <18.5       : Under Weight'),
                                        tags$li('BMI [18.5-24.99] : Normal Weight'),
                                        tags$li('BMI [25-29.99]   : Over Weight'),
                                        tags$li('BMI [30-34.99]   : Obese Class I'),
                                        tags$li('BMI [35-39.99]   : Obese Class II'),
                                        tags$li('BMI >=40         : Obese Class III')
                                )
                        ),
                        
                        h3('As per your Height & Weight you have inserted here:'), 
                        p('weight:'), verbatimTextOutput("inputweightvalue"),
                        p('height:'), verbatimTextOutput("inputheightvalue"),
                        h3('Your BMI is:'),
                        verbatimTextOutput("estimation"),
                        p('Therefore, you are:'),strong(verbatimTextOutput("diagnostic"))
                        
                        
                )
                
        )   
)