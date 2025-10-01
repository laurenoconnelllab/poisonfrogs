#' Poison frog palettes
#'
#'
#' @keywords internal
poison_palettes <- list(
  ranitomeya1 = c("#2A5D86", "#658C93", "#587F61", "#7F852B", "#4A4B13"),
  ranitomeya2 = c("#122F51", "#3D5689", "#8E97B5", "#E1C250", "#4D4B13"),
  ranitomeya3 = c("#538D71", "#3C6B78", "#983E18", "#A26021", "#CFA838"),
  ossp1 = c("#29211B", "#5D4224", "#8A511B", "#BBA141", "#E5CE64"),
  ossp2 = c("#432B18", "#712C0F", "#BF5522", "#F1A53A", "#F6C644"),
  osotokiki = c("#431509", "#862D12", "#D19F36", "#EED95D", "#D0D9D0"),
  dtalanis = c("#090B0A", "#263F48", "#6A9CB4", "#DAA538", "#CBC664"),
  dtazureus = c("#282349", "#161C4D", "#163978", "#4268B4", "#869BD7"),
  pterribilis = c("#42350C", "#6E5006", "#CD9920", "#E1B931", "#EED364"),
  atrtanimboca = c("#15170E", "#9ACF46", "#E8F649", "#BBE5AE", "#3B95C8"),
  amacero = c("#14374A", "#3981BE", "#64B936", "#C6E74B", "#7D2A1D"),
  ahahneli = c("#150F06", "#664B20", "#F5CF49", "#FBF9D9", "#3C696D")
)
#' List available poison palettes
#' @return A character vector of palette names.
#' @export
poison_palettes_names <- function() sort(names(poison_palettes))

#' Get colours from a poison frog palette
#'
#' Generator for both discrete and continuous palettes
#'
#' @param name Character. Palette name (see [poison_palettes_names()]).
#' @param n Integer (optional). Number of colours to return. Defaults to the
#'   palette length for `type = "discrete"` and 256 for `type = "continuous"`.
#' @param type Either `"discrete"` or `"continuous"`.
#' @param direction Integer. `1` for forward, `-1` for reversed order.
#' @param alpha Optional numeric in `[0, 1]`. Uniform transparency applied to
#'   all colours.
#'
#' @return Character vector of hex colours (alpha applied if requested).
#' @export
#' @importFrom grDevices colorRampPalette adjustcolor
poison_palette <- function(
  name,
  n = NULL,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL
) {
  type <- match.arg(type)
  stopifnot(direction %in% c(1, -1))

  pal <- poison_palettes[[name]]
  if (is.null(pal)) {
    stop(
      sprintf(
        "Palette '%s' not found. Available: %s",
        name,
        paste(poison_palettes_names(), collapse = ", ")
      ),
      call. = FALSE
    )
  }
  if (direction == -1) {
    pal <- rev(pal)
  }

  if (is.null(n)) {
    n <- if (type == "discrete") length(pal) else 256L
  }

  cols <- if (type == "discrete") {
    # keep strict behavior: do not silently recycle beyond palette length
    if (n > length(pal)) {
      stop(
        sprintf(
          "Palette '%s' has %d colours; requested n = %d.",
          name,
          length(pal),
          n
        ),
        call. = FALSE
      )
    }
    pal[seq_len(n)]
  } else {
    grDevices::colorRampPalette(pal, interpolate = "spline")(n)
  }

  if (!is.null(alpha)) {
    cols <- grDevices::adjustcolor(cols, alpha.f = alpha)
  }
  cols
}

#' Discrete palette function factory (for ggplot2)
#'
#' Returns a function that takes `n` and yields `n` colours (used by
#' [ggplot2::discrete_scale()]).
#'
#' @param name Palette name.
#' @param direction `1` forward, `-1` reversed.
#' @param alpha Optional transparency in `[0, 1]`.
#'
#' @return A function `function(n) -> character[n]` of hex colours.
#' @keywords internal
#' @noRd
poison_pal <- function(name, direction = 1, alpha = NULL) {
  function(n) {
    poison_palette(
      name,
      n = n,
      type = "discrete",
      direction = direction,
      alpha = alpha
    )
  }
}


#' Show a poison frog palette as coloured tiles
#'
#' @param name Palette name (see [poison_palettes_names()]).
#' @param n Number of colours to show (defaults to full length for discrete,
#'   or 16 for continuous).
#' @param type "discrete" or "continuous".
#' @param direction `1` forward, `-1` reversed.
#' @param alpha Optional transparency in [0, 1].
#'
#' @return A ggplot2 object (plot of the palette).
#' @export
#'
#' @importFrom ggplot2 ggplot aes geom_tile geom_text scale_fill_identity
#' @importFrom ggplot2 scale_x_continuous scale_y_continuous theme_void theme
show_poison <- function(
  name,
  n = NULL,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL
) {
  type <- match.arg(type)
  if (is.null(n)) {
    n <- if (type == "discrete") length(poison_palettes[[name]]) else 16L
  }

  cols <- poison_palette(
    name,
    n = n,
    type = type,
    direction = direction,
    alpha = alpha
  )

  df <- data.frame(
    x = seq_len(n),
    y = 1L,
    col = cols,
    lab = cols
  )

  ggplot2::ggplot(df, ggplot2::aes(x = x, y = y, fill = col)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = lab), vjust = -0.5, size = 8) +
    ggplot2::scale_fill_identity() +
    ggplot2::scale_x_continuous(expand = c(0, 0)) +
    ggplot2::scale_y_continuous(expand = c(0, 0)) +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "none")
}
