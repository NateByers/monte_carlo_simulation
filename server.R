

shinyServer(function(input, output) {
  
  output$injpress_distribution <- renderPlot({
    mu <- input$injpress_mean
    stdv <- input$injpress_sd
    xseq <- seq(mu - 4*stdv, mu + 4*stdv, .01*stdv)
    densities<-dnorm(xseq, mu, stdv)
    plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",
         lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
  })
  
  output$injtemp_distribution <- renderPlot({
    mu <- input$injtemp_mean
    stdv <- input$injtemp_sd
    xseq <- seq(mu - 4*stdv, mu + 4*stdv, .01*stdv)
    densities <- dnorm(xseq, mu, stdv)
    plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",
         lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
  })
  
  output$cooltemp_distribution <- renderPlot({
    mu <- input$cooltemp_mean
    stdv <- input$cooltemp_sd
    xseq <- seq(mu - 4*stdv, mu + 4*stdv, .01*stdv)
    densities <- dnorm(xseq, mu, stdv)
    plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",
         lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
  })
  
})
