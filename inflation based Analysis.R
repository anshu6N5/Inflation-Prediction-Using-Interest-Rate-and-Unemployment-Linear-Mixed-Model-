install.packages("MASS")
# loading of necessary libraries 
library(tidyverse)
library(readr)
library(janitor)
library(ggplot2)
library(WDI)
library(nlme)
library(lmerTest)
library(performance)

# Modeling The CPI using  LLME test
#search the indicators for the project.
WDIsearch("Inflation")
WDIsearch("unemployment")
WDIsearch("Interest rate")


#Get data from the world bank 
data <- WDI(country = "all", indicator = c("FP.CPI.TOTL.ZG", "SL.UEM.TOTL.ZS", "FR.INR.LEND"), start = 2000, end = 2022)
view(data)

#cleaning of data 
data <- data %>% 
  clean_names() %>% 
  rename(
    inflation = fp_cpi_totl_zg,
    unemployment = sl_uem_totl_zs,
    interest_rate = fr_inr_lend
  ) %>% 
  drop_na(inflation, unemployment, interest_rate)
names(data)

# model 

model <-lmer(inflation~unemployment+interest_rate+(1|country), data = data)                                                    
summary(data)

#calculating R^2 
r2(model)


#predicted vs Actual 
data$predicted <- predict(model)

#graphical representation 
ggplot(data, aes(x = predicted, y = inflation)) + 
  geom_point(alpha = 1, color = "black") + 
  geom_abline(slope = 1, intercept = 0, color ="darkgreen") + 
  geom_smooth(method = "lm", se = FALSE, color = "red") + 
  labs(
    title = "The Inflation Analysis based on Interest Rate and Unemployment ",
    subtitle = "The Actual VS Predicted Inflation",
    source = "Data : WDI via World Bank"
  ) +
  theme_minimal()
