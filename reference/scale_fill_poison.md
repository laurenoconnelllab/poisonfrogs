# Poison frog fill scale for ggplot2

A unified **fill** scale that works with either **discrete** or
**continuous** data, controlled by `type`. For discrete data it uses
[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html),
and for continuous data it builds a smooth gradient with
[`ggplot2::scale_fill_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Usage

``` r
scale_fill_poison(
  name,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL,
  ...
)
```

## Arguments

- name:

  Character. Name of the poison-frog palette to use (see
  `poison_palette_names`).

- type:

  Either `"discrete"` or `"continuous"`. Selects which kind of ggplot2
  scale is constructed.

- direction:

  Integer. `1` for the palette in its stored order, `-1` to reverse it.

- alpha:

  Optional numeric in `[0, 1]`. If supplied, applies a uniform
  transparency to all colours (both discrete and continuous modes).

- ...:

  Additional arguments passed to the underlying ggplot2 scale (e.g.
  `limits`, `breaks`, `labels`, `guide`, `oob`, etc.).

## Value

A ggplot2 scale object.

## See also

[`scale_colour_poison()`](https://laurenoconnelllab.github.io/poisonfrogs/reference/scale_colour_poison.md),
[`poison_palette()`](https://laurenoconnelllab.github.io/poisonfrogs/reference/poison_palette.md),
`poison_pal()`

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)
library(gapminder)

# Discrete example
ggplot(gapminder, aes(x = continent, y = lifeExp, fill = continent)) +
geom_violin(trim = FALSE, alpha = 0.75) +
geom_jitter(
 shape = 21,
 position = position_jitter(0.1),
 alpha = 0.3,
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
theme_classic(base_size = 32, base_line_size = 0.5) +
scale_fill_poison(
 name = "Ramazonica",
 type = "discrete",
 alpha = 0.95,
 direction = -1
 ) +
theme(legend.position = "none") +
xlab(NULL)

# Continuous example
ggplot(df_nottem, aes(x = temp, y = month, fill = stat(x))) +
geom_density_ridges_gradient(scale = 2, rel_min_height = 0.01) +
scale_fill_poison(
 name = "Ramazonica",
 type = "continuous",
 alpha = 0.95,
 direction = 1
 ) +
labs(
fill = "ºF") +
theme_light(base_size = 26, base_line_size = 0.5) +
theme(
 legend.position = "right",
 legend.justification = "left",
 legend.margin = margin(0,0,0,0),
 legend.box.margin = margin(-20,-20,-20,-20)
 )
} # }
```
