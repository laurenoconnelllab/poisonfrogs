# Poison frog colour scale for ggplot2

A **colour** scale that works with either **discrete** or **continuous**
data, controlled by `type`. For discrete data it uses
[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html),
and for continuous data it builds a smooth gradient with
[`ggplot2::scale_colour_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Usage

``` r
scale_colour_poison(
  name,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL,
  ...
)

scale_color_poison(
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

## Details

- **Discrete:** relies on an internal function factory `poison_pal()`
  that returns `n` colours on demand for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

- **Continuous:** generates a 256-colour gradient via
  [`poison_palette()`](https://laurenoconnelllab.github.io/poisonfrogs/reference/poison_palette.md)
  (type `"continuous"`) and passes it to
  [`ggplot2::scale_colour_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## See also

[`scale_fill_poison()`](https://laurenoconnelllab.github.io/poisonfrogs/reference/scale_fill_poison.md),
[`poison_palette()`](https://laurenoconnelllab.github.io/poisonfrogs/reference/poison_palette.md),
`poison_pal()`

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)
library(gapminder)

# Discrete example
ggplot(gapminder, aes(x = lifeExp, y = log(gdpPercap), colour = continent)) +
 geom_point(alpha = 0.2) +
 scale_colour_poison(name = "Ramazonica", type = "discrete") +
 stat_smooth() +
 facet_wrap(. ~ continent, scales = "free") +
 theme_minimal(21, base_line_size = 0.2) +
 theme(
   legend.position = "none",
   strip.background = element_blank(),
   strip.placement = "outside"
   )

# Continuous example
ggplot(mtcars, aes(wt, mpg, colour = disp)) +
 geom_point(size = 3) +
 scale_colour_poison("Dtalanis", type = "continuous", direction = -1) +
 stat_smooth(col = "black") +
 theme_classic(base_size = 32, base_line_size = 0.5)
} # }
```
