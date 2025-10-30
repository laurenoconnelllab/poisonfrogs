#' Poison frog colour scale for ggplot2
#'
#' A **colour** scale that works with either **discrete** or
#' **continuous** data, controlled by `type`. For discrete data it uses
#' [ggplot2::discrete_scale()], and for continuous data it builds a smooth
#' gradient with [ggplot2::scale_colour_gradientn()].
#'
#' @param name Character. Name of the poison-frog palette to use
#'   (see `poison_palette_names`).
#' @param type Either `"discrete"` or `"continuous"`. Selects which kind of
#'   ggplot2 scale is constructed.
#' @param direction Integer. `1` for the palette in its stored order, `-1` to
#'   reverse it.
#' @param alpha Optional numeric in `[0, 1]`. If supplied, applies a uniform
#'   transparency to all colours (both discrete and continuous modes).
#' @param ... Additional arguments passed to the underlying ggplot2 scale
#'   (e.g. `limits`, `breaks`, `labels`, `guide`, `oob`, etc.).
#'
#' @details
#' - **Discrete:** relies on an internal function factory `poison_pal()` that
#'   returns `n` colours on demand for [ggplot2::discrete_scale()].
#' - **Continuous:** generates a 256-colour gradient via `poison_palette()`
#'   (type `"continuous"`) and passes it to [ggplot2::scale_colour_gradientn()].
#'
#' @return A ggplot2 scale object.
#'
#' @seealso [scale_fill_poison()], `poison_palette()`, `poison_pal()`
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(gapminder)
#'
#' # Discrete example
#' ggplot(gapminder, aes(x = lifeExp, y = log(gdpPercap), colour = continent)) +
#'  geom_point(alpha = 0.2) +
#'  scale_colour_poison(name = "Ramazonica", type = "discrete") +
#'  stat_smooth() +
#'  facet_wrap(. ~ continent, scales = "free") +
#'  theme_minimal(21, base_line_size = 0.2) +
#'  theme(
#'    legend.position = "none",
#'    strip.background = element_blank(),
#'    strip.placement = "outside"
#'    )
#'
#' # Continuous example
#' ggplot(mtcars, aes(wt, mpg, colour = disp)) +
#'  geom_point(size = 3) +
#'  scale_colour_poison("Dtalanis", type = "continuous", direction = -1) +
#'  stat_smooth(col = "black") +
#'  theme_classic(base_size = 32, base_line_size = 0.5)
#' }
#'
#' @export
#' @importFrom ggplot2 discrete_scale scale_colour_gradientn
scale_colour_poison <- function(
  name,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL,
  ...
) {
  type <- match.arg(type)

  if (type == "discrete") {
    ggplot2::discrete_scale(
      aesthetics = "colour",
      scale_name = name,
      palette = poison_pal(name = name, direction = direction, alpha = alpha),
      ...
    )
  } else {
    cols <- poison_palette(
      name = name,
      n = 256,
      type = "continuous",
      direction = direction,
      alpha = alpha
    )
    ggplot2::scale_colour_gradientn(colours = cols, ...)
  }
}

#' @rdname scale_colour_poison
#' @export
scale_color_poison <- scale_colour_poison


#' Poison frog fill scale for ggplot2
#'
#' A unified **fill** scale that works with either **discrete** or
#' **continuous** data, controlled by `type`. For discrete data it uses
#' [ggplot2::discrete_scale()], and for continuous data it builds a smooth
#' gradient with [ggplot2::scale_fill_gradientn()].
#'
#' @inheritParams scale_colour_poison
#'
#' @return A ggplot2 scale object.
#'
#' @seealso [scale_colour_poison()], `poison_palette()`, `poison_pal()`
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(gapminder)
#'
#' # Discrete example
#' ggplot(gapminder, aes(x = continent, y = lifeExp, fill = continent)) +
#' geom_violin(trim = FALSE, alpha = 0.75) +
#' geom_jitter(
#'  shape = 21,
#'  position = position_jitter(0.1),
#'  alpha = 0.3,
#'  size = 0.8,
#'  bg = "grey"
#'  ) +
#' stat_summary(
#'  fun = mean,
#'  geom = "point",
#'  size = 1.5,
#'  color = "black",
#'  alpha = 0.6
#'  ) +
#' theme_classic(base_size = 32, base_line_size = 0.5) +
#' scale_fill_poison(
#'  name = "Ramazonica",
#'  type = "discrete",
#'  alpha = 0.95,
#'  direction = -1
#'  ) +
#' theme(legend.position = "none") +
#' xlab(NULL)
#'
#' # Continuous example
#' ggplot(df_nottem, aes(x = temp, y = month, fill = stat(x))) +
#' geom_density_ridges_gradient(scale = 2, rel_min_height = 0.01) +
#' scale_fill_poison(
#'  name = "Ramazonica",
#'  type = "continuous",
#'  alpha = 0.95,
#'  direction = 1
#'  ) +
#' labs(
#' fill = "ºF") +
#' theme_light(base_size = 26, base_line_size = 0.5) +
#' theme(
#'  legend.position = "right",
#'  legend.justification = "left",
#'  legend.margin = margin(0,0,0,0),
#'  legend.box.margin = margin(-20,-20,-20,-20)
#'  )
#' }
#'
#' @export
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
scale_fill_poison <- function(
  name,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL,
  ...
) {
  type <- match.arg(type)

  if (type == "discrete") {
    ggplot2::discrete_scale(
      aesthetics = "fill",
      scale_name = name,
      palette = poison_pal(name = name, direction = direction, alpha = alpha),
      ...
    )
  } else {
    cols <- poison_palette(
      name = name,
      n = 256,
      type = "continuous",
      direction = direction,
      alpha = alpha,
      return = "vector"
    )
    ggplot2::scale_fill_gradientn(colours = cols, ...)
  }
}
