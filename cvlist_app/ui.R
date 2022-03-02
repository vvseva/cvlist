library("googledrive")
library("googlesheets4") # I am using the developing version 0.1.0.9000
library("shiny")
library(DT)
# library("kableExtra")


ui <- # Define UI for application that plots random distributions
  fluidPage(# Application title
    titlePanel("Candidates"),
    fluidRow(
      column(
        6,
        
        tags$div(class="header", checked=NA,
                 tags$p("With the current situation around Ukraine and Russia, lots of my university friends in Saint Petersburg are highly motivated to find a job abroad."),
                 tags$a(href="https://www.linkedin.com/posts/anna-iashina_datascience-analytics-ml-activity-6904429272870608896-AWw4", 
                        "Original post, please read")
        )
      )
    ),
    fluidRow(),
    # Show a plot of the generated distribution
    fluidRow(column(
      8,
      DTOutput("tbl")
    )))