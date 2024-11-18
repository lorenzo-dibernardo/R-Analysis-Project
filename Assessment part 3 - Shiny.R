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
        label = "Please choose a Visualization",
        choices = list(
          "Histogram of Age" = "p1",
          "Bar Plot of Satisfaction" = "p2",
          "Bar Plot of Gender Counts" = "p3",
          "Income Distribution by Gender" = "p4",
          "Satisfaction by Gender (Boxplot)" = "p5"
        )
      ),
      actionButton(inputId = "plot", label = "Change Visualization")
    ),
    
    # Main panel to display the plots
    mainPanel(
      plotlyOutput(outputId = "selected_plot")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Reactive value to store the current selected plot
  current_plot <- reactiveVal(NULL)
  
  # Observe the "Change Visualization" button click
  observeEvent(input$plot, {
    # Update the plot based on the current selection
    if (input$Visualisation == "p1") {
      p1 <- ggplot(cleaned_dataset1, aes(x = Age)) +
        geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
        labs(title = "Distribution of Age", x = "Age", y = "Frequency") +
        theme_minimal()
      current_plot(ggplotly(p1))
      
    } else if (input$Visualisation == "p2") {
      p2 <- ggplot(cleaned_dataset1, aes(x = factor(Satisfaction))) +
        geom_bar(fill = "lightgreen", color = "black") +
        labs(title = "Distribution of Satisfaction Scores", x = "Satisfaction Score", y = "Count") +
        theme_minimal()
      current_plot(ggplotly(p2))
      
    } else if (input$Visualisation == "p3") {
      p3 <- ggplot(cleaned_dataset1, aes(x = Gender)) +
        geom_bar(fill = "lightgreen", color = "black") +
        labs(title = "Gender Distribution", x = "Gender", y = "Count") +
        theme_minimal()
      current_plot(ggplotly(p3))
      
    } else if (input$Visualisation == "p4") {
      p4 <- ggplot(cleaned_dataset1, aes(x = Income, fill = Gender)) +
        geom_density(alpha = 0.5) +
        labs(title = "Income Distribution by Gender", x = "Income (GBP pa)", y = "Density") +
        theme_minimal()
      current_plot(ggplotly(p4))
      
    } else if (input$Visualisation == "p5") {
      p5 <- ggplot(cleaned_dataset1, aes(x = Gender, y = Satisfaction, fill = Gender)) +
        geom_boxplot() +
        labs(title = "Satisfaction by Gender", x = "Gender", y = "Satisfaction Score") +
        theme_minimal()
      current_plot(ggplotly(p5))
    }
  })
  
  # Render the selected plot
  output$selected_plot <- renderPlotly({
    req(current_plot())  # Ensure a plot is available before rendering
    current_plot()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
