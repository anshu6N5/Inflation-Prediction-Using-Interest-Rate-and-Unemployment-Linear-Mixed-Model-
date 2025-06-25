# Inflation-Prediction-Using-Interest-Rate-and-Unemployment-Linear-Mixed-Model-

This project explores inflation prediction using a **Linear Mixed Effects Model (LMM)** across countries and years. The goal is to assess how well macroeconomic indicators like **interest rate** and **unemployment** explain variations in inflation globally.

## 🔍 Objective
To model and predict inflation across countries using:
- **Interest Rate**
- **Unemployment Rate**

- With **Country** included as a random effect to account for country-specific variation.

- 📊 Data
- **Structure**: Country-Year panel data
- **Source**: Compiled from economic data (custom dataset, no direct World Bank download)

- ## 🧠 Methodology
- Used `lmer()` from the `lme4` package in R
- Evaluated model using:
  - **Marginal R²**: 0.147 (variance explained by fixed effects)
  - **Conditional R²**: 0.403 (variance explained by full model including random effects)
- Visualized model fit with actual vs predicted inflation plots

- ## 🔎 Insights
- The model **predicts well for moderately inflated countries**, especially when inflation is under control.
- High outliers (hyperinflation episodes) are harder to predict due to non-linearity and missing predictors like oil price, exchange rate, etc.


## 📁 Files
- `inflation_model.R`: Model building and evaluation
- `inflation_plot.jpeg`: Actual vs predicted plot

## Author 
- Anshu Kumar

## profiles 
- GIT Hub = https://github.com/anshu6N5
- Linkedin = https://www.linkedin.com/in/anshu-kumar-04240b225/ 
