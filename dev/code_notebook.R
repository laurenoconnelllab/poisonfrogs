install.packages("ggplot2")

library(ggplot2)
library(tidyverse)

# Helper functions

poison_palettes_names() #give names of all poison frogs palettes

poison_palette("ossp2", type = "discrete", direction = 1) #print the hex code of the named palette

show_poison("ossp2", type = "discrete", direction = 1) #plot the names palette and the hex codes


#continuous scale example
ggplot(mpg, aes(displ, hwy, fill = cty)) +
  geom_point(shape = 21, size = 3, colour = "white") +
  scale_fill_poison("amacero", type = "continuous")

#discrete scale
ggplot(gapminder, aes(continent, lifeExp, fill = continent)) +
  geom_boxplot(alpha = 0.9) +
  scale_fill_poison("dtalanis", type = "discrete", alpha = 0.95)


set.seed(123) # reproducible

# Create dummy data

example_data <- tibble(
  group = factor(rep(c("A", "B", "C", "D", "E"), each = 50)),
  value = c(
    rnorm(50, mean = 800, sd = 160), # group A
    rnorm(50, mean = 600, sd = 90), # group B
    rnorm(50, mean = 500, sd = 80), # group C
    rnorm(50, mean = 300, sd = 80), # group D
    rnorm(50, mean = 270, sd = 80) # group E
  )
)
#discrete scale
ggplot(example_data, aes(group, value, fill = group)) +
  geom_boxplot(alpha = 0.9) +
  theme_classic(base_size = 32, base_line_size = 0.5) +
  scale_fill_poison(
    "ahahneli",
    type = "discrete",
    alpha = 0.95,
    direction = -1
  )
