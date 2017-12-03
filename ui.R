

dashboardPage(
  dashboardHeader(title = "Monte Carlo Simulation"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Model", tabName = "model", icon = icon("line-chart")),
      menuItem("Simulation", tabName = "simulation", icon = icon("area-chart"))
    )
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "model",
              fluidRow(
                column(width = 4,
                  box(title = "Linear Model", width = 12,
                      lm_formula),
                  box(title = "Distributions", width = 12,
                      plotOutput("empirical_distributions"))
                ),
                box(width = 8, dataTableOutput("data_table"))
              )
              ),
      tabItem(tabName = "simulation",
              
              column(width = 4,
                     box(title = "Horse Power Parameters", width = NULL,
                         fluidRow(
                           column(width = 5,
                                  numericInput("hp_mean", "Mean", 
                                               value = round(mean(cars$hp)), 2)
                           ),
                           column(width = 5,
                                  numericInput("hp_sd", "SD", 
                                               value = round(sd(cars$hp)), 2)
                           )
                         ),
                         fluidRow(
                           plotOutput("hp_distribution", width = "80%", height = "200px")
                         )
                     ),
                     box(title = "Weight Parameters", width = NULL,
                         fluidRow(
                           column(width = 5,
                                  numericInput("wt_mean", "Mean", 
                                               value = round(mean(cars$wt)), 2)
                           ),
                           column(width = 5,
                                  numericInput("wt_sd", "SD", 
                                               value = round(sd(cars$wt)), 2)
                           )
                         ),
                         fluidRow(
                           plotOutput("wt_distribution", width = "80%", height = "200px")
                         )
                     )
                     ),
              column(width = 1,
                     actionButton("simulate", "Simulate")
              ),
              column(width = 7,
                     box(title = "Predicted MPG from 10,000 simulated inputs", width = NULL,
                         plotOutput("predicted")
                         )
                     )
               
              )
              )
    )
    
  )

