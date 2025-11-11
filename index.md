# Color Palettes Inspired in Neotropical Poison Frogs

![R-CMD-check](reference/figures/rcmdcheck.svg)![Lifecycle:
stable](reference/figures/lifecycle-stable.svg)

A collection of 31 colour palettes inspired in Neotropical poison frogs.
With more than 200 brighly colored species, Neotropical poison frogs
paint the rain forest in vivid hues that shout a clear message: “I’m
toxic!”. Spice up your plots with `poisonfrogs` and give your dataviz a
toxic twist! But wait, we also included 11 color palettes inspired on
other pretty frog species, because… why not?

## Installation

You can install `poisonfrogs` from CRAN:

``` r
install.packages("poisonfrogs")
```

or from the development version in GitHub with:

``` r
remotes::install_github("laurenoconnelllab/poisonfrogs")
```

load the package:

``` r
library(poisonfrogs)
```

## Poison frog color palettes “*At a glance*”

![](reference/figures/Mosaic_all.png)

## Usage

To call the names of all the 42 colour palettes in poisonfrogs:

``` r
poison_palettes_names()
#>  [1] "Afemoralis"      "Afulguritus"     "Amacero"         "Aminutus"       
#>  [5] "Ashihuemoy"      "Atrivittata"     "Bpicturata"      "Dauratus"       
#>  [9] "Dsarayacuensis"  "Dtalanis"        "Dtazureus"       "Eanthonyi"      
#> [13] "Edarwinwallacei" "Etricolor"       "Haureoguttatum"  "Hcinerascens"   
#> [17] "Hhobbsi"         "Llineatus"       "Mlaevigata"      "Oanchicayensis" 
#> [21] "Ohistrionica"    "Olehmanni"       "Opbluejeans"     "Opcolon"        
#> [25] "Opescudo"        "Oploma"          "Opsancristobal"  "Opuyama"        
#> [29] "Osceiba"         "Oscolon"         "Oskoi"           "Oslita"         
#> [33] "Osotokiki"       "Ossanantonio"    "Pterribilis"     "Ptomopterna"    
#> [37] "Pvaillantii"     "Ramazonica"      "Ribanded"        "Ristriped"      
#> [41] "Rmarina"         "Rvariabilis"
```

Plot poison frog palettes and print the hex codes of the colours in
every palette:

``` r
# plot palette with hex codes
poison_palette("Haureoguttatum")
```

![](reference/figures/README-unnamed-chunk-6-1.png)

``` r

# get hex codes for a vector
cols <- poison_palette("Dtalanis", return = "vector")

cols
#> [1] "#090B0A" "#263F48" "#499AC1" "#EEA715" "#FED126"
```

## Examples

### Continuos scale

``` r

require(tidyverse)
require(gapminder)
require(gridExtra)
require(ggridges)

#continuous scale

df_nottem <- tibble(
  year  = floor(time(nottem)),
  month = factor(month.abb[cycle(nottem)], levels = month.abb),
  temp  = as.numeric(nottem)
)

p1 <- ggplot(df_nottem, aes(x = temp, y = month, fill = after_stat(x))) +
  geom_density_ridges_gradient(scale = 2, rel_min_height = 0.01) +
  scale_fill_poison(
    name = "Oskoi",
    type = "continuous",
    alpha = 0.95,
    direction = -1) +
  labs(
  fill = "ºF",
  y = NULL,
  x = NULL) +
  theme_classic(base_size = 20, base_line_size = 0.5) +
  theme(legend.position = "right", legend.justification = "left",
  legend.margin = margin(0,0,0,0),
  legend.box.margin = margin(-5,-5,-5,-5)) +
  coord_cartesian(clip = "off")

p1
```

![](reference/figures/README-unnamed-chunk-7-1.png)

### Discrete scale 1

``` r

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
  theme_classic(base_size = 20, base_line_size = 0.5) +
  scale_fill_poison(
    name = "Oanchicayensis",
    type = "discrete",
    alpha = 0.95,
    direction = -1
  ) +
  theme(legend.position = "none") +
  xlab(NULL) +
  ylab("Life Expentancy")

p2
```

![](reference/figures/README-unnamed-chunk-8-1.png)

### Discrete scale 2

``` r
#discrete scale 2
p3 <- ggplot(gapminder, aes(x = lifeExp, y = log(gdpPercap), colour = continent)) +
  geom_point(alpha = 0.2) +
  scale_colour_poison(name = "Ramazonica", type = "discrete") +
  stat_smooth() +
  facet_wrap(.~continent, scales = "free") +
  theme_minimal(20, base_line_size = 0.2) +
  theme(legend.position = "none",
  strip.background = element_blank(), strip.placement = "outside") 

p3
```

![](reference/figures/README-unnamed-chunk-9-1.png)
