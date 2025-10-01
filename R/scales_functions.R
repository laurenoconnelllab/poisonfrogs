#' Poison frog colour scale for ggplot2
#'
#' A unified **colour** scale that works with either **discrete** or
#' **continuous** data, controlled by `type`. For discrete data it uses
#' [ggplot2::discrete_scale()], and for continuous data it builds a smooth
#' gradient with [ggplot2::scale_colour_gradientn()].
#'
#' @param name Character. Name of the poison-frog palette to use
#'   (must exist in your internal `poison_palettes` registry).
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
#' @seealso [scale_fill_poison()], `poison_palette()`, `poison_pal()`, `show_poison()`
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' # Discrete example
#' ggplot(mtcars, aes(factor(cyl), fill = factor(gear))) +
#'   geom_bar() +
#'   scale_fill_poison("O_sylvatica_N", type = "discrete")
#'
#' # Continuous example
#' ggplot(mtcars, aes(wt, mpg, colour = disp)) +
#'   geom_point(size = 3) +
#'   scale_colour_poison("D_tinctorius", type = "continuous", direction = -1)
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
#' @seealso [scale_colour_poison()], `poison_palette()`, `poison_pal()`, `show_poison()`
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' # Discrete example
#' ggplot(mpg, aes(class, fill = drv)) +
#'   geom_bar() +
#'   scale_fill_poison("O_sylvatica_S", type = "discrete", alpha = 0.95)
#'
#' # Continuous example
#' ggplot(mpg, aes(displ, hwy, fill = cty)) +
#'   geom_point(shape = 21, size = 3, colour = "white") +
#'   scale_fill_poison("D_tinctorius", type = "continuous")
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
      alpha = alpha
    )
    ggplot2::scale_fill_gradientn(colours = cols, ...)
  }
}
