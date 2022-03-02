library(shiny)
library("googlesheets4")
library("shiny")
library(DT)
library(dplyr)
library(stringr)

gs4_auth(path = "cvlist-5a763ac3f721.json")

to_href <- function(link, link_text){
  str_c(
    "<a href='", {{link}}, "'>", {{link_text}}, "</a>")
}

to_mail <- function(mail){
  str_c(
    "<a href='mailto:", {{mail}}, "'>", {{mail}}, "</a>")
}

server <- function(input, output, session) {
   df = read_sheet(
    "https://docs.google.com/spreadsheets/d/1WimbMiZD38FyCeek5Rxj7LnLW-ii7Yl55jBzQTN4DKE/edit?usp=sharing",
    range = "Candidates"
  ) 
  data_row <- df[sample(1:nrow(df)), ]
  
  output$tbl <- data_row %>% 
    select(-Status) %>% 
    mutate(LinkedIn = to_href(LinkedIn, LinkedIn),
           `Resume/CV` = to_href(`Resume/CV`, "CV"),
           email = to_mail(email),
           Telegram = to_href(str_c("https://telegram.me/", Telegram), Telegram)
           ) %>% 
  renderDT(
    filter = 'top',
    escape = FALSE,
    options = list(pageLength = 100, autoWidth = TRUE)
  )
  
  # observeEvent(input$add, {
  #   df <-read_sheet("https://docs.google.com/spreadsheets/d/150R62xJnOOcYebyEZNUwhXHzjfCeyx2QwRdTuMU-5Gg/edit?usp=sharing"
  #   )
  #   output$df <- renderTable(df)
  # })
  
}

shinyServer(server)
