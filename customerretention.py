'''
Caitlin Nguyen
#2352689
caitnguyen@chapman.edu
CPSC 392-1
HW 1


This code and analysis focused on predicting customer spending behavior and exploring trends in customer attributes for a clothing store dataset.

## Project Overview

The project aims to help the clothing store predict how much their customers will spend per year based on various customer attributes. 
It also involves exploring how customer characteristics have changed over time.

## Data Description

The dataset used in this analysis includes the following variables:

- `gender`: Self-disclosed gender identity (male, female, nonbinary, or other).
- `age`: Current age of the customer.
- `height_cm`: Self-reported height converted to centimeters.
- `waist_size_cm`: Self-reported waist size converted to centimeters.
- `inseam_cm`: Self-reported inseam (measurement from crotch of pants to floor) converted to centimeters.
- `test_group`: Whether or not the customer is in an experimental test group that receives special coupons once a month (0 for no, 1 for yes).
- `salary_self_report_in_k`: Self-reported salary of the customer in thousands.
- `months_active`: Number of months the customer has been part of the clothing store's preferred rewards program.
- `num_purchases`: The number of purchases the customer has made.
- `amount_spent_annual`: The average amount the customer has spent at the store per year.

## Analysis Steps

1. Data Preprocessing:
   - Handling missing values.
   - Z-score scaling for continuous variables.
   - One-Hot Encoding for categorical variables.

2. Model Building:
   - Two models were built: Linear Regression and Polynomial Regression (degree=2).

3. Model Evaluation:
   - Calculating metrics including Mean Squared Error (MSE), Mean Absolute Error (MAE), Mean Absolute Percentage Error (MAPE), and R-squared (R2) for both training and testing sets.

4. Trends Analysis:
   - Investigating changes in customer attributes (height, waist size, inseam) over the years.

5. Question 1
- the analysis, I explored whether being in an experimental test group has an impact on the amount customers spend at the store. I also investigated if this impact varies across different genders.

6. Question 2
    - we aimed to analyze whether the customer base of a clothing store has changed over time in terms of physical characteristics such as height, waist size, and inseam. 
    - To achieve this, we calculated the minimum, maximum, and average values of these characteristics for each year in the dataset.

## Results

- Linear Regression Model (Training):
  - MSE: 15385.64
  - MAE: 97.89
  - MAPE: 0.139
  - R2: 0.431

- Polynomial Regression Model (Testing):
  - MSE: 5511.62
  - MAE: 59.64
  - MAPE: 0.080
  - R2: 0.799

## Conclusions

The linear and polynomial regression models provide insights into customer spending behavior and attribute trends. 
Overall, the models suggest stable relationships between customer attributes and spending, with the polynomial model showing better predictive performance.

## Suggestions for Future Analysis

- Explore advanced modeling techniques for further improving predictive accuracy.
- Consider collecting additional customer data, such as preferences and seasonal trends, to enhance the models.
- Continuously update and refine the analysis as more data becomes available.

'''