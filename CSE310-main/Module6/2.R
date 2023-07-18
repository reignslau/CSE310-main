# Load the ggplot2 library for data visualization
library(ggplot2)

# Create random data for the scatter plot
set.seed(123)  # Setting a seed for reproducibility
x <- rnorm(50, mean = 10, sd = 2)  # Generating 50 random points from a normal distribution
y <- x + rnorm(50, mean = 5, sd = 1)  # Adding some noise to create a relationship between x and y

# Create a data frame from the x and y data
data_df <- data.frame(x, y)

# Create the scatter plot
scatter_plot <- ggplot(data_df, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Simple Scatter Plot",
       x = "X-axis",
       y = "Y-axis") +
  theme_minimal()

# Display the plot
print(scatter_plot)