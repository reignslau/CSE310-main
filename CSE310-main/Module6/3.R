# Sample data for the bar plot
categories <- c("Category A", "Category B", "Category C", "Category D")
frequency <- c(25, 15, 40, 30)

# Create a data frame from the data
data_df <- data.frame(Category = categories, Frequency = frequency)

# Load the ggplot2 library for data visualization
library(ggplot2)

# Create the bar plot
bar_plot <- ggplot(data_df, aes(x = Category, y = Frequency)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.7) +
  labs(title = "Bar Plot of Categories",
       x = "Categories",
       y = "Frequency") +
  theme_minimal()

# Display the plot
print(bar_plot)