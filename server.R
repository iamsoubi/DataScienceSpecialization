
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
BMI<-function(weight,height) {weight/(height^2)}
diagnostic_f<-function(weight,height){
        BMI_value<-weight/(height^2)
        ifelse(BMI_value<18.5,"Under Weight",ifelse(BMI_value<25,"Normal Weight",ifelse(BMI_value<30,"Over Weight",ifelse(BMI_value<35,"Obease Class I",ifelse(BMI_value<40,"Obease Class II","Obease Class III")))))
}
shinyServer(function(input, output) {
        
        output$inputweightvalue <- renderPrint({input$weight})
        output$inputheightvalue <- renderPrint({input$height})
        output$estimation <- renderPrint({BMI(input$weight,input$height)})
        output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
} 
)
