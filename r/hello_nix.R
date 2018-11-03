#!/usr/bin/env Rscript

library(ggplot2)
library(shiny)

ui = function() {
    sliderUI = function() sliderInput( inputId='bins'
                                     , label  =h4('Bin width')
                                     , min    = 1
                                     , max    =10
                                     , value  = 5
                                     )
    return(fluidPage( titlePanel('Hello Shiny!')
                    , sidebarLayout( sidebarPanel(sliderUI())
                                   , mainPanel(plotOutput(outputId='distPlot'))
                                   )
                    ))
}

server = function(input, output) {
    distPlot = function() {
        ggplot(faithful, aes(x=waiting)) +
            geom_histogram(binwidth=input$bins) +
            labs( title='Histogram of waiting times'
                , x    ='Waiting time to next eruption (minutes)'
                , y    ='Frequency'
                )
    }
    output$distPlot = renderPlot(distPlot())
}

main = function() {
    path = Sys.getenv('BROWSERPATH')
    options('browser'=path)
    shinyApp(ui=ui(), server=server, options=list('launch.browser'=TRUE))
}

if (sys.nframe() == 0) main()
