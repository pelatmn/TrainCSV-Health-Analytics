# TrainCSV-Health-Analytics
A comprehensive statistical analysis of health data using R, exploring key medical metrics and advanced modeling techniques.

# 📊 Statistical Analysis of `train.csv` Dataset

## 📋 Overview

Welcome to the statistical analysis project of the `train.csv` dataset. This project dives into a comprehensive examination of health-related data for 159,255 individuals, leveraging R for in-depth statistical analysis and visualization.

## 🏗️ Project Structure

### 1. 📝 Data Description

- **Dataset Overview:** The `train.csv` dataset includes a variety of health metrics, such as age, height, weight, blood pressure (systolic and diastolic), cholesterol levels (HDL and LDL), fasting blood sugar, and more.
- **Medical Terminology:** Key medical terms such as systolic pressure, diastolic pressure, and cholesterol are explained to provide clarity on the variables being analyzed.

### 2. ⚙️ Data Processing

- **Random Sampling:** A subset of 2,000 records was randomly sampled from the original dataset to facilitate focused analysis.
- **Data Transformation:** The dataset was converted into a data frame format, enabling streamlined data manipulation and analysis.

### 3. 📈 Statistical Analyses

#### 3.1. 📊 Frequency Distribution
- **Relative Frequency Calculation:** Using the `mean` function, relative frequencies for variables like age, cholesterol, AST, and serum creatinine were computed.

#### 3.2. 🔍 Confidence Intervals
- **Mean Confidence Interval:** A confidence interval for the mean systolic blood pressure was constructed using the `t.test` function.
- **Median Confidence Interval:** The `wilcox.test` function was used to calculate a confidence interval for the median fasting blood sugar level.

#### 3.3. 🎯 Proportion Testing
- **Proportion Hypothesis Test:** The `prop.test` function was employed to test the proportion of successes within the dataset (e.g., individuals with a specific health condition).

#### 3.4. ⚖️ Pairwise Comparisons
- **Group Mean Comparisons:** Pairwise comparisons between group means, such as initial weight versus post-diet weight, were performed using the `pairwise.t.test` function.

### 4. 📊 Data Visualization

- **Cholesterol Histograms:** The distribution of cholesterol levels was visualized and analyzed using histograms generated with the `ggplot2` package.

### 5. 🚀 Advanced Modeling

- **Boosting Algorithm (`mboost`):** A boosting model was applied to predict cholesterol levels based on age and weight, utilizing the powerful `mboost` package for high-dimensional data analysis.

### 6. 📄 Dynamic Reporting

- **Report Generation with `knitr`:** The entire analysis was documented and compiled into a dynamic HTML report using the `knitr` package, integrating code and results seamlessly.

## 🛠️ Dependencies

This project utilizes the following R packages:

- `data.table` 📂
- `ggplot2` 📊
- `mboost` 🚀
- `knitr` 📄

## 📚 References

- 📖 Long J. (JD) & Teetor P. (2019). *R Cookbook* (2nd Edition). O'Reilly Media.
- 📖 Hofner B., Mayr A., Robinzonov N., Schmid M. (2014). *Model-based Boosting in R – A Hands-on Tutorial Using the R Package mboost*. Computational Statistics, 29:3–35.

## 📫 How to Contribute

Contributions are welcome! Feel free to open an issue or submit a pull request.
