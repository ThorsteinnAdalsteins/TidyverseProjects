# Wayne Gretzky's goals on data.world
library(tidyverse)
library(data.world)
library(ggplot2)

## collect data.world token
source('./_Secrets/data.world-token.R')
page <- 'https://data.world/rhubarbarosa/random-thoughts'

## help
vignette('quickstart', package = 'data.world')

## ################################################
##  Question 1: How many goals did he score
##              and for what team
## ################################################
question.1.data <- function(){
  first.query <- data.world::qry_sql(
    paste(
      "select tm, year(date) the_year,",
      "sum(cast(per as integer)) sum_per, count(1) n_matches",
      "from gretzkygoals_2 ",
      "group by tm, year(date)" ,
      "order by year(date), tm"
    )
  )
  
  goals.per.year <- data.world::query(first.query, dataset = page)
}

goals.per.year <- question.1.data()

question.1.graph.1 <- function(goals.per.year){
  g <- ggplot(goals.per.year)
  g + 
    geom_col(aes(x = the_year, y = sum_per, fill = tm)) +
    theme_classic() + 
    labs(x = '', y = 'Goals')
}

question.1.graph.1(goals.per.year)


## ################################################
##  Question 2: What was the most likely number of goals
## ################################################


question.2.data <- function(){
  
  a.query <- data.world::qry_sql(
    paste(
      "select year(d.date) the_year, month(d.date) the_month, day(d.date) the_day,",
      "d.date, CAST(d.per as integer) per, d.arena_name, d.goalie",
      "from gretzkygoals_2 d",
      "order by d.date desc, d.per"
    )
  )
  
  goals.per.game <- data.world::query(a.query, dataset = page)
  
  
}

goals.per.game <- question.2.data()


## Question 2.1: How many times did he score one, two or three goals?

question.2.figure.1 <- function(goals.per.game){
  d <- goals.per.game %>% 
    group_by(Árabil = cut(the_year, c(seq(1970, 2000, 5))), per) %>%
    filter(!is.na(per)) %>%
    dplyr::summarise(count = n())
  
  g <- ggplot(d)
  g + 
    geom_col(aes(x = per, y = count, fill = Árabil), position = "dodge") +
    theme_classic()+
    labs(x = 'Mörk í leik', 
         y = 'Fjöldi')
}

question.2.figure.1(goals.per.game)



