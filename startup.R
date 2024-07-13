library(caret)
library(pacman)

# Load the dataset
data <- read.csv("/Users/caitlin/Desktop/zencap@caitnguyen/zencap@caitnguyen.csv")

# Split the dataset into training and validation sets
set.seed(123)
train_index <- createDataPartition(data$Business_Failure, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
valid_data <- data[-train_index, ]

# Build a logistic regression model
model <- glm(Business_Failure ~ Revenue + Net_Profit + Debt_Ratio + Market_Share + Age_of_Business +
               Location_Type + Customer_Satisfaction + Innovation_Index + Rent_Cost +
               Regulation_Compliance + Number_of_Employees + Social_Media_Followers +
               Number_of_Branches + CEO_Tenure + Local_Unemployment_Rate + Global_Economic_Growth +
               Industry_Average_Profit_Margin + Median_Work_Experience, data = train_data, family = binomial)

#print out logistic regression model
summary(model)

# Calculate confusion matrix without manual thres-holding
valid_predictions <- predict(model, newdata = valid_data, type = "response")
valid_predictions_class <- ifelse(valid_predictions > 0.5, 1, 0)

# Ensure 'Business_Failure' is a factor with the same levels in both data sets
train_data$Business_Failure <- as.factor(train_data$Business_Failure)
valid_data$Business_Failure <- as.factor(valid_data$Business_Failure)

# Check for NAs in the target variable
if (sum(is.na(valid_data$Business_Failure)) > 0) {
  cat("Warning: There are missing values in the 'Business_Failure' variable in the validation dataset.\n")
}

# Examine unique levels in both datasets
unique_levels_train <- levels(train_data$Business_Failure)
unique_levels_valid <- levels(valid_data$Business_Failure)

# Check if levels don't match
if (!identical(unique_levels_train, unique_levels_valid)) {
  cat("Warning: The levels of 'Business_Failure' do not match between the training and validation datasets.\n")
  
  # Manually align the levels
  train_data$Business_Failure <- factor(train_data$Business_Failure, levels = levels(valid_data$Business_Failure))
  
  cat("Levels aligned between training and validation datasets.\n")
}

# Set levels of valid_predictions_class to match valid_data$Business_Failure
valid_predictions_class <- factor(valid_predictions_class, levels = levels(valid_data$Business_Failure))

# Calculate confusion matrix
conf_matrix <- confusionMatrix(valid_predictions_class, valid_data$Business_Failure)

# Additional Metrics
accuracy <- conf_matrix$overall['Accuracy']
precision <- conf_matrix$byClass['Pos_Pred_Value']
recall <- conf_matrix$byClass['Sensitivity']

cat(paste("Accuracy: ", round(accuracy, 4), "\n"))
cat(paste("Precision: ", round(precision, 4), "\n"))
cat(paste("Recall: ", round(recall, 4), "\n"))

# Print the confusion matrix and other evaluation metrics
print(conf_matrix)

# Define a threshold for investment
investment_threshold <- 0.5  

# Identify start ups for investment based on the threshold
investment_candidates <- valid_data[valid_predictions > investment_threshold, ]

# Print a list of start ups that meet the investment criteria
cat("Startups recommended for investment:\n")
print(investment_candidates)

#comprehensive and insightful commentary
cat("Based by the logistic regression model, 'Business_Failure.'")
cat("The p-value is not significant which concludes 'Business_Failure' is not statistically different from 0")
cat("Significant predictors would be the 'Age_of_Business', 'Innovation_Index', and 'Median_Work_Experience'.")
cat("The investment threshold, set at 0.5 in the model, plays a crucial role in deciding which startups to invest in.")
cat("Based on the confusion matrix, 74 startups were predicted as successful and 48 startups were predicted as failures.")
cat("The accuracy of the model is 73.05% due to 25 startups were incorrected predicted as successful and 25 startups were incorrected predicted as failures.")

#recommendation
cat("Prioritize companies with higher values for the model-identified statistically relevant predictors. For instance, while making investment selections, take into account the 'Age_of_Business,' 'Innovation_Index,' and 'Median_Work_Experience.' The probability of success is significantly influenced by these characteristics.")
cat("Since the investment criterion is currently set at 0.5, businesses with success probabilities above 50% are advised for investment. Adapt this level in accordance with ZenCap's investment philosophy and risk appetite. When the barrier is larger, investments will be more cautious, but when the threshold is lower, more aggressive techniques might be used.")
cat("Consider talking with industry experts or data scientists if the model's results conflict with ZenCap's subject expertise or investment goals. They might offer insightful commentary and suggestions for enhancing the model.")
cat("Startups with a longer operational history, a higher innovation index, and experienced teams have a greater chance of succeeding.")
cat("It's crucial to periodically update the model with fresh data if you want to keep it accurate over time. The model should adjust to shifting dynamics as the startup ecosystem changes in order to make useful predictions.")
cat("Whether they are centered on monetary returns, sector growth, or strategic goals, all recommendations and insights should be in direct alignment with ZenCap's specific investing goals.")

#conclusion
cat("In conclusion, ZenCap has a powerful tool to support investment decisions thanks to the logistic regression model. ZenCap can make more informed, data-driven, and coordinated investments in the dynamic world of startups by concentrating on key predictors, fine-tuning the investment threshold, diversifying the portfolio, and consulting experts as necessary.")







