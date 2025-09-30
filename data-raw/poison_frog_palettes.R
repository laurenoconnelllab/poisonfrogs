#' Here is the complete list of colour palettes based on poison frogs
#'
#'
#' @export
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


#' This is the function to generate a colour palette
#'
#' These palettes are inspired by the warning colouration of Neotropical
#' poison frogs. Call this to get a vector of colours you can use in
#' `ggplot2::scale_*_manual()` (discrete) or in `*_gradientn()` (continuous).
#'
#' @param name Name of desired palette. Choices include those in [poison_palette_names()].
#' @param n Number of colours desired. If omitted, uses all colours (for
#'   discrete) or 256 (for continuous).
#' @param type Either `"continuous"` or `"discrete"`. Use `"continuous"` if you
#'   want an interpolated gradient.
#' @return A character vector of hex colours, classed as `"palette"` for pretty printing.
#' @examples
#' # Discrete usage (manual scale)
#' # ggplot(mtcars, aes(factor(cyl), fill = factor(cyl))) +
#' #   geom_bar() +
#' #   scale_fill_manual(values = poison_palette("azureus", n = 3))
#'
#' # Continuous usage (gradient)
#' # pal <- poison_palette("azureus", n = 21, type = "continuous")
#' # ggplot(faithfuld, aes(eruptions, waiting, fill = density)) +
#' #   geom_raster() +
#' #   scale_fill_gradientn(colours = pal)
#'
#' @export
poison_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- poison_palettes[[name]]
  if (is.null(pal)) {
    stop("Palette not found: ", name, call. = FALSE)
  }

  if (missing(n)) {
    n <- if (type == "discrete") length(pal) else 256L
  }

  if (type == "discrete" && n > length(pal)) {
    stop(
      "Requested ",
      n,
      " colours, but palette '",
      name,
      "' has only ",
      length(pal),
      ". Use type = 'continuous' to interpolate.",
      call. = FALSE
    )
  }

  cols <- switch(
    type,
    continuous = grDevices::colorRampPalette(as.character(pal))(n),
    discrete = as.character(pal)[seq_len(n)]
  )
  structure(cols, class = "palette", name = name)
}

#' List available poison-frog palettes
#' @return Character vector of palette names.
#' @export
poison_palette_names <- function() names(poison_palettes)

# Pretty printer (like wesanderson)
#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  op <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(op), add = TRUE)

  image(
    1:n,
    1,
    as.matrix(1:n),
    col = x,
    ylab = "",
    xaxt = "n",
    yaxt = "n",
    bty = "n"
  )
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  txt <- attr(x, "name")
  if (!is.null(txt)) text((n + 1) / 2, 1, labels = txt, cex = 1)
}
