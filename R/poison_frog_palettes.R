#' Poison frog palettes
#'
#'
#' @keywords internal
poison_palettes <- list(
  Ramazonica = c("#3C6B78", "#538D71", "#CFA838", "#A26021", "#983E18"),
  Rispotted = c("#2A5D86", "#658C93", "#587F61", "#C4B500", "#4A4B13"),
  Ribanded = c("#0C0D0C", "#F2B705", "#F29F05", "#A65D03", "#F2F2F2"),
  Rvariabilis = c("#122F51", "#3D5689", "#8E97B5", "#E1C250", "#4D4B13"),
  Afulguritus = c("#110906", "#56601B", "#A9C248", "#B2B52A", "#8DA1A9"),
  Aminutus = c("#181011", "#512A18", "#833717", "#C4AE3D", "#C5CDC5"),
  Osotokiki = c("#29211B", "#5D4224", "#8A511B", "#BBA141", "#E1B522"),
  Oscolon = c("#432B18", "#712C0F", "#D74905", "#FFAC18", "#FBF895"),
  Ossanantonio = c("#D9D4BA", "#F2A7B5", "#F23005", "#8C0E03", "#3F402C"),
  Oslita = c("#431509", "#862D12", "#D19F36", "#EED95D", "#D0D9D0"),
  Oskoi = c("#09142A", "#B8351F", "#F88705", "#ABD0DD", "#F2F9FE"),
  Olehmanni = c("#1B110F", "#FE4705", "#F59356", "#7997A5", "#D9DFDF"),
  Oanchicayensis = c("#261717", "#5A2511", "#FA6100", "#FCC908", "#D1D3DB"),
  Ohistrionica = c("#181A0C", "#A20D05", "#F23D07", "#FB7309", "#FE8E04"),
  Opescudo = c("#46AFD2", "#CFC387", "#9EA979", "#B12F0A", "#192326"),
  Opcolon = c("#E6CD13", "#95AE26", "#E07E12", "#8B5E58", "#351D0A"),
  Oploma = c("#00262C", "#005E6C", "#00AEB0", "#21B66E", "#64B146"),
  Opsancristobal = c("#ECAA4E", "#E15511", "#48353C", "#1B5280", "#072643"),
  Opuyama = c("#9AAEB0", "#0086A1", "#214F6D", "#451A0E", "#010100"),
  Opbluejeans = c("#512118", "#D5411F", "#637C94", "#3A5169", "#181717"),
  Dtnouragues = c("#090B0A", "#263F48", "#499AC1", "#EEA715", "#FED126"),
  Dtazureus = c("#282349", "#161C4D", "#163978", "#4268B4", "#869BD7"),
  Dauratus = c("#171517", "#1B445B", "#4AA3B8", "#2AB8A2", "#96D02B"),
  Pterribilis = c("#42350C", "#6E5006", "#E19F05", "#F9C207", "#FCD94B"),
  Afemoralis = c("#171006", "#7F541B", "#FFD70A", "#E8CB99", "#D6E5CD"),
  Atrivittata = c("#15170E", "#9ACF46", "#E8F649", "#BBE5AE", "#3B95C8"),
  Amacero = c("#14374A", "#3981BE", "#64B936", "#C6E74B", "#7D2A1D"),
  Ashihuemoy = c("#151018", "#664328", "#FE9C01", "#19AC0C", "#23A7A6"),
  Eanthonyi = c("#F2DC9B", "#D95204", "#A60311", "#590202", "#0B0B0D"),
  Etricolor = c("#D9D7BA", "#4A4E8C", "#593A15", "#402B12", "#261C14"),
  Edarwinwallacei = c("#F2F2F2", "#F2D479", "#D99C52", "#403636", "#0D0A0A"),
  Bpicturata = c("#291D11", "#726241", "#9F7A6A", "#CFCDAC", "#D9D6D3"),
  Dsarayacuensis = c("#FDFFFD", "#EAD676", "#B18044", "#BE5121", "#5F3C10"),
  Haureoguttatum = c("#732937", "#565902", "#D9A404", "#D9CAB0", "#F2F2F2"),
  Hcinerascens = c("#CCB33C", "#979136", "#57724C", "#9C4E1E", "#49210D"),
  Hhobbsi = c("#EBE6D5", "#86948C", "#949C67", "#9A7726", "#4F290A"),
  Llineatus = c("#C0B956", "#C69B40", "#C75D25", "#493836", "#20110A"),
  Mlaevigata = c("#9FBF5A", "#C7D93D", "#A4A677", "#59573C", "#0D0D0D"),
  Ptomopterna = c("#C7AE91", "#648225", "#C57B2B", "#6F3812", "#240904"),
  Pvaillantii = c("#CEC4B9", "#C89353", "#979136", "#424A17", "#5E2421"),
  Rmarina = c("#D7CCA2", "#B7A05D", "#84652E", "#4B250B", "#2E1204")
)
#' List the names of available color palettes inspired in poison frogs and other frog species.
#' @return A character vector of palette names.
#' @examples
#'
#' poison_palettes_names()
#'
#' @export

poison_palettes_names <- function() sort(names(poison_palettes))

#'
#'
#' Plot and print poison frog color palettes.
#'
#' Visualize colors and print hexcodes from a poison frog color palette.
#'
#' @param name Character. Name of poison frog palette (one of `poison_palettes_names()`).
#' @param n Integer (optional). Number of colours to use. Defaults to the
#'   palette length (max. n = 5) for `type = "discrete"` and 256 for `type = "continuous"`.
#' @param type Either `"discrete"` or `"continuous"`.
#' @param direction Integer. `1` for forward, `-1` for reversed order.
#' @param alpha Optional numeric in `[0, 1]`. Uniform transparency applied to
#'   all colours.
#' @param return Either `"plot"` (default) to show a tile plot with hex labels,
#'   or `"vector"` to return a character vector of hex colours.
#'
#' @return If `return = "plot"`, a ggplot2 object. If `return = "vector"`,
#'   a character vector of hex colours.
#'
#' @examples
#' # Show a palette as tiles (default)
#' poison_palette("Ramazonica")
#'
#' # Reverse order and show only 4 colours
#' poison_palette("Ramazonica", n = 4, direction = -1)
#'
#' # Get a vector with the palette hex codes
#' cols <- poison_palette("Ramazonica", return = "vector")
#'
#' # Continuous gradient preview (16 swatches)
#' poison_palette("Osotokiki", type = "continuous", n = 16)
#'
#' @export
#' @importFrom grDevices colorRampPalette adjustcolor
#' @importFrom ggplot2 ggplot aes geom_tile geom_text scale_fill_identity
#' @importFrom ggplot2 scale_x_continuous scale_y_continuous theme_void theme
#' @importFrom rlang .data
poison_palette <- function(
  name,
  n = NULL,
  type = c("discrete", "continuous"),
  direction = 1,
  alpha = NULL,
  return = c("plot", "vector")
) {
  type <- match.arg(type)
  return <- match.arg(return)
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

  # Default n
  if (is.null(n)) {
    n <- if (type == "discrete") length(pal) else 256L
  }

  # Build colours
  cols <- if (type == "discrete") {
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

  if (return == "vector") {
    return(cols)
  }

  # Plot preview (tile strip with hex labels)
  df <- data.frame(
    x = seq_len(n),
    y = 1L,
    col = cols,
    lab = cols
  )

  ggplot2::ggplot(
    df,
    ggplot2::aes(x = .data$x, y = .data$y, fill = .data$col)
  ) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(
      ggplot2::aes(label = .data$lab),
      vjust = -0.5,
      size = 5
    ) +
    ggplot2::scale_fill_identity() +
    ggplot2::scale_x_continuous(expand = c(0, 0)) +
    ggplot2::scale_y_continuous(expand = c(0, 0)) +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "none")
}

#' Discrete palette function factory (for ggplot2)
#' @keywords internal
#' @noRd
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
