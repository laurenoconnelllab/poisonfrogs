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

ggsci::scale_color_aaas()

ggsci::pal_aaas()

?poisonfrogs

scale_fill_poison()
scale_fill_viridis_b()
scale_fill_brewer()

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


install.packages("poisonfrogs_1.0.0.tar.gz", repos = NULL, type = "source")


require(tidyverse)
require(gapminder)
require(gridExtra)
require(ggridges)

#continuous scale

df_nottem <- tibble(
  year = floor(time(nottem)),
  month = factor(month.abb[cycle(nottem)], levels = month.abb),
  temp = as.numeric(nottem)
)

p1 <- ggplot(df_nottem, aes(x = temp, y = month, fill = after_stat(x))) +
  geom_density_ridges_gradient(scale = 2, rel_min_height = 0.01) +
  scale_fill_poison(
    name = "Osceiba",
    type = "continuous",
    alpha = 0.95,
    direction = 1
  ) +
  labs(
    fill = "ºF",
    y = NULL,
    x = NULL
  ) +
  theme_minimal(base_size = 10, base_line_size = 0.5) +
  theme(
    legend.position = "right",
    legend.justification = "left",
    legend.margin = margin(0, 0, 0, 0),
    legend.box.margin = margin(-5, -5, -5, -5)
  ) +
  coord_cartesian(clip = "off")

p1

#discrete scale 1
p2 <- ggplot(gapminder, aes(x = continent, y = lifeExp, fill = continent)) +
  geom_boxplot(alpha = 0.95, outliers = F) +
  geom_jitter(
    shape = 21,
    position = position_jitter(0.1),
    alpha = 0.2,
    size = 0.8,
    bg = "grey"
  ) +
  stat_summary(
    fun = mean,
    geom = "point",
    size = 1.5,
    color = "black",
    alpha = 0.6
  ) +
  theme_classic(base_size = 10, base_line_size = 0.5) +
  scale_fill_poison(
    name = "Osceiba",
    type = "discrete",
    alpha = 0.95,
    direction = -1
  ) +
  theme(legend.position = "none") +
  xlab(NULL) +
  ylab("Life Expentancy")

p2


#discrete scale 2
p3 <- ggplot(
  gapminder,
  aes(x = lifeExp, y = log(gdpPercap), colour = continent)
) +
  geom_point(alpha = 0.2) +
  scale_colour_poison(name = "Osceiba", type = "discrete") +
  stat_smooth() +
  facet_wrap(. ~ continent, scales = "free") +
  theme_minimal(10, base_line_size = 0.2) +
  theme(
    legend.position = "none",
    strip.background = element_blank(),
    strip.placement = "outside"
  )

p3


# Packages
library(ggplot2)
library(scales)
# library(poisonfrogs)   # uncomment if not already loaded

#---- 1) Simulate data ----
set.seed(42)
n <- 300
x <- runif(n, 0, 10)
y <- 1.5 + 0.9 * x + rnorm(n, sd = 0.4 + 0.25 * x) # increasing variance
sz <- rescale(y, to = c(2, 14)) # point sizes

df <- data.frame(x, y, sz)

#---- 2) Get the Oskoi palette ----
palpois <- poison_palette(
  "Ramazonica",
  type = "continuous",
  return = "vector",
  direction = -1
) # adjust arg name if your function differs

#---- 3) Plot ----
p4 <- ggplot(df, aes(x, y)) +
  geom_point(
    aes(fill = y, size = sz),
    shape = 21,
    color = "black",
    alpha = 0.95,
    stroke = 0.6
  ) +
  scale_size_identity(guide = "none") +
  scale_fill_gradientn(colors = palpois, name = NULL) +
  theme_minimal() +
  ylim(0, 18) +
  xlim(0, 11)

p4


#all plots
grid.arrange(p1, arrangeGrob(p2, p3, nrow = 2), nrow = 1)


library(ggplot2)
library(scales)
library(plotly)

#---- 1) Simulate data (yours) ----
set.seed(42)
n <- 300
x <- runif(n, 0, 10)
y <- 1.5 + 0.9 * x + rnorm(n, sd = 0.4 + 0.25 * x) # increasing variance
sz <- rescale(y, to = c(2, 14))
df <- data.frame(x, y, sz)

# Add a z dimension with similar structure
df$z <- 0.35 * x + 0.55 * y + rnorm(n, sd = 0.6)

#---- 2) Poison palette ----
palpois <- poison_palette(
  "Amacero",
  type = "continuous",
  return = "vector",
  direction = -1
)
to_colorscale <- function(cols) {
  n <- length(cols)
  lapply(seq_len(n), function(i) list((i - 1) / (n - 1), cols[i]))
}

#---- 3) 3D scatter ----
plot_ly(
  df,
  x = ~x,
  y = ~y,
  z = ~z,
  type = "scatter3d",
  mode = "markers",
  marker = list(
    size = ~sz,
    color = ~y, # color by y (like your 2D fill)
    colorscale = to_colorscale(palpois),
    showscale = FALSE,
    opacity = 0.95,
    line = list(color = "black", width = 1)
  )
) %>%
  layout(
    scene = list(
      xaxis = list(title = "x", range = c(0, 11)),
      yaxis = list(title = "y", range = c(0, 18)),
      zaxis = list(title = "z"),
      camera = list(eye = list(x = 1.6, y = 1.6, z = 0.8))
    ),
    margin = list(l = 0, r = 0, b = 0, t = 0)
  )


library(rgl)
# map y to colors from your palette
cols <- palpois[as.numeric(cut(
  df$y,
  breaks = length(palpois),
  include.lowest = TRUE
))]
open3d()
plot3d(
  df$x,
  df$y,
  df$z,
  col = cols,
  size = df$sz,
  type = "s", # spheres
  box = TRUE
)
rgl.bg(color = "white")
rgl::rglwidget()
