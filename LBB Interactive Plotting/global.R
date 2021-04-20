library(ggplot2)
library(tidyverse)
library(dplyr)
library(GGally)
library(viridis)
library(ggpubr)
library(shiny)
library(shinydashboard)
library(plotly)

# Read data
student <- read.csv(file = "data_input/StudentsPerformance.csv")

# Add total
student$total <- student$math.score + student$reading.score + student$writing.score

# Options for choices
raceOpt <- unique(student$race.ethnicity)
genderOpt <- unique(student$gender)
parenteducationOpt <- unique(student$parental.level.of.education)
lunchOpt <- unique(student$lunch)
courseOpt <- unique(student$test.preparation.course)