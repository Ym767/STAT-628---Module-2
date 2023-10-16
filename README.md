
# STAT628 Module 2 - Group 6

This repository contains the work of Group 6 for Module 2 in STAT628, focusing on building a body fat prediction model and deploying it as a web application.

## Directory Structure

```
STAT628-Module2-Group6/
│
├── code/ 
│   ├── app.R  # Code for the Shiny app
│   └── Group6_maincode.Rmd  # Main code and analysis in R Markdown
│
├── data/ 
│   ├── BodyFat.csv  # Original dataset
│   └── cleaned_data.csv  # Processed and cleaned data
|
├── presentation documents/ 
│   ├── STAT628 Group6.pptx  # presentation file for the project.
│   └── Executive Summary.pdf  # executive summary for the project.
│
├── image/  # Various images and plots used in the analysis and presentation
│   ├── abdomenscatterplot/ #scatterplot of abdomen vs body fat
│   ├── decisiontree/ #decision tree used to find predictors for model
│   ├── normal qq plot/ #to test for normality condition of final model
│   ├── predictors_qqplot/ #Q-Q plot of various predictors
│   ├── residualsvsfitted/ #residual vs fitted plot of final model
│   └── wristscatterplot/ #scattterplot of wrist vs body fat
│
└── README.md  # This file
```

## Explanation of Files and Folders

- `code/`: Contains the main code files for the project.
    - `app.R`: The R script to run the Shiny app for body fat prediction.
    - `Group6_maincode.Rmd`: A R Markdown file containing the main analysis and methodology.

- `data/`: Stores the datasets used in this project.
    - `BodyFat.csv`: The original dataset used for building the prediction model.
    - `cleaned_data.csv`: The cleaned data obtained after preprocessing.
    
- `presentation documents/`: Stores the document files used to explain this project.
    - `STAT628 Group6.pptx`: The presentation file for the project.
    - `Executive Summary.pdf` : A 2-page executive summary of data cleaning, analysis, and discussion of model.

- `image/`: Contains images and plots that might be used in the analysis, presentation, or within the Shiny app. Each subfolder or image corresponds to different aspects or sections of the analysis.

- `README.md`: Provides an overview and explains the repository structure (this file).

## Body Fat Prediction App

You can access the Body Fat Prediction App developed based on our model directly via the following link:
[Body Fat Prediction App](https://bodyfatprediction.shinyapps.io/bodyfatprediction/)

---

**Note**: Ensure you have all the necessary R packages installed and loaded to run the code files and Shiny app locally.

## Contributors

- Abigail Sikora
- Yeming Wei
- Kai Shukla
