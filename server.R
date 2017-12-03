

shinyServer(function(input, output) {
  
  output$empirical_distributions <- renderPlot({
    par(mfrow=c(4,1))
    for(i in c("mpg", "cyl", "hp", "wt")){
      hist(cars[[i]], main = i, xlab = "")
    }
  })
  
  output$data_table <- renderDataTable({
    cars[, c("mpg", "cyl", "hp", "wt")]
  })
  
  output$cyl_distribution <- renderPlot({
    plot_distribution(input$cyl_mean, input$cyl_sd)
  })
  
  output$hp_distribution <- renderPlot({
    plot_distribution(input$hp_mean, input$hp_sd)
  })
  
  output$wt_distribution <- renderPlot({
    plot_distribution(input$wt_mean, input$wt_sd)
  })
  
  output$predicted <- renderPlot({
    input$simulate
    
    mus <- c(mus[["cyl"]], isolate(input$hp_mean), isolate(input$wt_mean))
    sds <- c(sds[["cyl"]], isolate(input$hp_sd), isolate(input$wt_sd))
    sims <- simulate_data(n = 10000, mus = mus, sds = sds)
    
    predicted <- predict(lm_fit, sims)
    
    hist(predicted, xlab = "", main = "Histogram of MPG")
  })
  
})
