## Files Description

### 1. `Assessment part 1 -Datasets.R`
- **Purpose**: Generates and cleans simulated datasets.
- **Key Features**:
  - Simulates messy datasets with demographic and behavioral information.
  - Cleans the datasets by:
    - Removing duplicates.
    - Standardizing date formats and gender labels.
    - Handling missing values and outliers.
  - Saves cleaned datasets in the `data/` folder as `.csv` and `.rds` files.
- **Output Files**:
  - `data/cleaned_dataset1.csv`
  - `data/cleaned_dataset1.rds`

### 2. `Assessment part 2 - RMarkdown.Rmd`
- **Purpose**: Provides a report analyzing and visualizing the cleaned dataset.
- **Key Features**:
  - Interactive visualizations (e.g., histograms, bar plots, density plots).
  - Descriptive analysis of demographic and satisfaction data.
- **Instructions**:
  - Open the `.Rmd` file in RStudio.
  - Ensure the `data/cleaned_dataset1.rds` file exists in the `data/` folder.
  - Knit the document to generate an HTML report.

### 3. `Assessment part 3 - Shiny.R`
- **Purpose**: Offers an interactive Shiny app for exploring the cleaned dataset.
- **Key Features**:
  - Allows users to visualize demographic and satisfaction trends.
  - Interactive plots (e.g., boxplots, bar plots).
  - Allows plots amendment according to accessibility needs. 
- **Instructions**:
  - Run the file in RStudio.
  - Ensure the `data/cleaned_dataset1.csv` file exists in the `data/` folder.
  - Access the app through the Shiny UI.

## Reproducibility
- **Working Directory**:
  - Each script dynamically sets the working directory to its location using:
    ```r
    setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
    ```
  - Ensure the project files remain in the same folder structure as described.

- **Output Files**:
  - All datasets are saved to the `data/` folder to maintain organization.

## How to Run the Project
1. **Setup**:
   - Clone the project folder to your local machine.
   - Open the project in RStudio.
2. **Run Dataset Script**:
   - Execute `Assessment part 1 -Datasets.R` to generate and clean datasets.
3. **Generate Report**:
   - Knit `Assessment part 2 - RMarkdown.Rmd` for the HTML report.
4. **Launch Shiny App**:
   - Run `Assessment part 3 - Shiny.R` to explore the data interactively.


