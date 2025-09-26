#' Complete list of poison-frog palettes
#'
#' Use [poison_palette()] to construct palettes of desired length.
#'
#' @export
poison_palettes <- palettes::pal_palette(
  # Replace these with your curated hex sets
  azureus = c("#0B1D51", "#1F3B99", "#4F7CEB", "#A0B8FF"),
  terribilis = c("#FFD100", "#333333"),
  pumilio_bocas = c("#D7191C", "#2C7BB6", "#FDAE61", "#ABD9E9"),
  histrionica = c("#F7C948", "#1F1F1F", "#E4572E"),
  leucomelas = c("#FFCC00", "#000000"),
  anthonyi_sara = c("#006D77", "#83C5BE", "#EDF6F9", "#FFDDD2", "#E29578")
)

#' A poison-frog palette generator
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
