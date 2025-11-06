install.packages("ggplot2")

library(ggplot2)
library(tidyverse)

# Helper functions

poison_palettes_names() #give names of all poison frogs palettes


poison_palette("Hcinerascens", n = 5)

poison_palette("Ramazonica", type = "continuous")

poison_palette("Etricolor", type = "discrete", direction = -1)

poison_palette("Dtalanis", type = "continuous", direction = -1) #print the hex code of the named palette

my_colors <- poison_palette("rimitator2", return = "vector")

class(my_colors)

poison_palette("caquita")

?scale_colour_poison()

scale_fill_poison()


#This function is important to make scale_fill/colour_poison for ggplot, because it will only recognize the setup of my functions
poison_pal <- function(name, direction = 1, alpha = NULL) {
  function(n) {
    poison_palette(
      name,
      n = n,
      type = "discrete",
      direction = direction,
      alpha = alpha,
      return = "vector" # <-- important for ggplot2
    )
  }
}


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


library(gapminder)
diamonds

str(gapminder)

#discrete scale
p2 <- ggplot(gapminder, aes(continent, lifeExp, fill = continent)) +
  geom_violin(trim = FALSE, alpha = 0.8) +
  geom_jitter(
    shape = 21,
    position = position_jitter(0.1),
    alpha = 0.2,
    size = 1.5,
    bg = "grey"
  ) +
  stat_summary(
    fun = mean,
    geom = "point",
    size = 1.5,
    color = "black",
    alpha = 0.9
  ) +
  theme_classic(base_size = 32, base_line_size = 0.5) +
  scale_fill_poison(
    "ranitomeya1",
    type = "discrete",
    alpha = 0.95,
    direction = -1
  ) +
  theme(legend.position = "none")


ggplot(mtcars, aes(wt, mpg, colour = disp)) +
  geom_point(size = 3) +
  scale_colour_poison("dtalanis", type = "continuous", direction = 1) +
  stat_smooth(col = "black") +
  theme_classic(base_size = 32, base_line_size = 0.5)


df_nottem <- tibble(
  year = floor(time(nottem)),
  month = factor(month.abb[cycle(nottem)], levels = month.abb),
  temp = as.numeric(nottem)
)

p1 <- ggplot(df_nottem, aes(x = temp, y = month, fill = stat(x))) +
  geom_density_ridges_gradient(scale = 1, rel_min_height = 0.01) +
  scale_fill_poison(
    "rimitator",
    type = "continuous",
    alpha = 0.95,
    direction = 1
  ) +
  labs(title = 'Temperatures at Nottingham, 1920-1939') +
  theme_classic(base_size = 26, base_line_size = 0.5)


#discrete scale 2

p3 <- ggplot(
  gapminder,
  aes(x = lifeExp, y = log(gdpPercap), colour = continent)
) +
  geom_point(alpha = 0.2) +
  scale_colour_poison(name = "rimitator", type = "discrete") +
  stat_smooth() +
  facet_wrap(. ~ continent, scales = "free") +
  theme_minimal(21, base_line_size = 0.2) +
  theme(
    legend.position = "none",
    strip.background = element_blank(),
    strip.placement = "outside"
  )

#all plots
grid.arrange(p1, arrangeGrob(p2, p3, nrow = 2), nrow = 1)


ggplot(df_nottem, aes(x = temp, y = month, fill = stat(x))) + # base plot: temp vs month, fill by density
  geom_density_ridges_gradient(scale = 1, rel_min_height = 0.01) + # add ridgeline densities
  scale_fill_poison(
    "rimitator",
    type = "continuous",
    alpha = 0.95,
    direction = 1
  ) + # apply custom gradient fill
  labs(title = 'Temperatures at Nottingham, 1920-1939') + # add title
  theme_classic(base_size = 26, base_line_size = 0.5) # classic theme + text/line size


require(ggpubr)


ggarrange()


#all plots
grid.arrange(p1, arrangeGrob(p2, p3, nrow = 2), nrow = 1)


zip - r
poisonfrogs - site.zip
docs


d3 <- poison_palette(
  "Oskoi",
  type = "discrete",
  return = "vector"
)

d3_rev <- poison_palette(
  "Oskoi",
  type = "discrete",
  direction = -1,
  return = "vector"
)
