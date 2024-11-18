
# Project Title

## Overview
This project demonstrates the use of R for data analysis and visualization. It includes:
- An R script for dataset creation and manipulation.
- An R Markdown report for exploratory analysis.
- A Shiny app for interactive visualization.

## Files Included
- `Assessment part 1 -Datasets.R`: Contains code for dataset creation and cleaning.
- `Assessment part 2 - RMarkdown.Rmd`: An R Markdown file for generating an analytical report.
- `Assessment part 3 - Shiny.R`: Code for a Shiny app for interactive visualization.

## Instructions

### Running the `.R` Script
1. Open `Assessment part 1 -Datasets.R` in RStudio or any R environment.
2. Run the script using:
   ```r
   source("Assessment part 1 -Datasets.R")
   ```

### Running the `.Rmd` File
1. Open `Assessment part 2 - RMarkdown.Rmd` in RStudio.
2. Render the file into an HTML/PDF/Word report by clicking the "Knit" button or using:
   ```r
   rmarkdown::render("Assessment part 2 - RMarkdown.Rmd")
   ```

### Running the Shiny App
1. Open `Assessment part 3 - Shiny.R` in RStudio.
2. Run the app using:
   ```r
   shiny::runApp("Assessment part 3 - Shiny.R")
   ```

## Example Outputs
### Dataset Creation Script
```r


# Assessment PART 1 ------------------------------------------------------------
#Create multiple simulated (or fabricated) datasets, 
#each of which have the same format. Note: This should be data you create, 
#not download. There is no requirement for the data to be realistic and you can 
#choose the topic, format, variables and values.

# Load libraries
library(tidyverse)
# Add any additional packages required here
library(dplyr)
library(lubridate)
library(ggplot2)

# Function to create a m  # Preview of the dataset script
```

### RMarkdown Report
```markdown
---
title: "Assessment part 2 - RMarkdown "
author: "Lorenzo di Bernardo - 24010510"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(
	echo = FALSE,
	message = FALSE,
	warning = FALSE
)
```

```{r message=FALSE, warning=FALSE, include=FALSE, paged.print=FALSE}
library(tidyverse)
library(plotly)

# Load the cleaned dataset
cleaned_dataset1 <- readRDS("cleaned_dataset1.rds")

```

# Demography and Behaviour - A Dataset {.tabset}

# {.tabset}

##   # Preview of the RMarkdown content
```

### Shiny App Code
```r
# Load necessary libraries
library(shiny)
library(ggplot2)
library(plotly)

# Dataset
cleaned_dataset1 <- read.csv("C:/Users/dibe_/OneDrive/Desktop/UHI Git-RStudio/Intro_to_R_Data_Vis/R/RMarkdown Reports/cleaned_dataset1.csv")

# Define UI for application
ui <- fluidPage(
  # Application title
  titlePanel("Income Satisfaction by Gender and Age"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "Visualisation",
        label = "Please choose a Visual  # Preview of the Shiny app code
```

## Requirements
- R version: [insert R version]
- Required packages:
  ```r
  install.packages(c("shiny", "ggplot2", "plotly", "rmarkdown"))
  ```

## License
[Specify your license, e.g., MIT License or GNU GPL]

## Contact
For any questions or issues, contact [Your Name or Email].
