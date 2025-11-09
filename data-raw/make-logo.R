library(hexSticker)
library(showtext)

img <- "data-raw/frog_logo.png"

## Loading Google fonts (http://www.google.com/fonts)

font_add_google("Patrick Hand", "patrick")

sticker(
  subplot = img,
  package = "poisonfrogs",
  p_color = "#404040ff",
  p_size = 22,
  p_y = 1.54,
  p_family = "patrick",
  p_fontface = "bold",
  filename = "man/figures/logo.png",
  s_x = 1,
  s_y = 1.07,
  s_width = .8,
  h_fill = "#f1f2f5ff",
  h_color = "#3a3a3aff"
)
