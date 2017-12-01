

dashboardPage(
  dashboardHeader(title = "Monte Carlo Simulation"),
  dashboardSidebar(#disable = TRUE
    ),
  dashboardBody(
    fluidRow(
      box(title = "InjPress Parameters", width = 4,
          fluidRow(
        column(width = 5,
          numericInput("injpress_mean", "Mean", 
                       value = mean(insulation_strength$InjPress))
        ),
        column(width = 5,
          numericInput("injpress_sd", "SD", 
                       value = sd(insulation_strength$InjPress))
        )
          ),
        fluidRow(
          plotOutput("injpress_distribution", width = "80%", height = "200px")
        )
      ),
      box(title = "InjTemp Parameters", width = 4,
          fluidRow(
            column(width = 5,
                   numericInput("injtemp_mean", "Mean", 
                                value = mean(insulation_strength$InjTemp))
            ),
            column(width = 5,
                   numericInput("injtemp_sd", "SD", 
                                value = sd(insulation_strength$InjTemp))
            )
          ),
          fluidRow(
            plotOutput("injtemp_distribution", width = "80%", height = "200px")
          )
          ),
      box(title = "CoolTemp Parameters", width = 4,
          fluidRow(
            column(width = 5,
                   numericInput("cooltemp_mean", "Mean", 
                                value = mean(insulation_strength$CoolTemp))
            ),
            column(width = 5,
                   numericInput("cooltemp_sd", "SD", 
                                value = sd(insulation_strength$CoolTemp))
            )
          ),
          fluidRow(
            plotOutput("cooltemp_distribution", width = "80%", height = "200px")
          )
      )
    )
  )
)
