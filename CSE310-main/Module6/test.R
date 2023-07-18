# SIR Epidemiological Model Simulation

# Libraries
library(ggplot2)

# Parameters
N <- 1000        # Total population size
beta <- 0.3      # Transmission rate
gamma <- 0.1     # Recovery rate
days <- 150      # Simulation duration

# Initial conditions
S <- N - 1       # Initial number of susceptible individuals (one infectious case)
I <- 1           # Initial number of infectious individuals
R <- 0           # Initial number of recovered individuals

# Storage vectors
susceptible <- numeric(days)
infectious <- numeric(days)
recovered <- numeric(days)

# Simulation loop
for (day in 1:days) {
  susceptible[day] <- S
  infectious[day] <- I
  recovered[day] <- R
  
  new_infections <- beta * S * I / N
  new_recoveries <- gamma * I
  
  S <- S - new_infections
  I <- I + new_infections - new_recoveries
  R <- R + new_recoveries
}

# Create a data frame for plotting
sim_data <- data.frame(Day = 1:days, Susceptible = susceptible, Infectious = infectious, Recovered = recovered)

# Plot the results
ggplot(sim_data, aes(x = Day)) +
  geom_line(aes(y = Susceptible, color = "Susceptible"), size = 1) +
  geom_line(aes(y = Infectious, color = "Infectious"), size = 1) +
  geom_line(aes(y = Recovered, color = "Recovered"), size = 1) +
  labs(title = "SIR Model Simulation",
       x = "Days",
       y = "Population",
       color = "Status") +
  scale_color_manual(values = c("Susceptible" = "blue", "Infectious" = "red", "Recovered" = "green")) +
  theme_minimal()