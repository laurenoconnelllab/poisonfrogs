library(hexSticker)
img <- "data-raw/frog_logo.png"

sticker(
  subplot = img,
  package = "poisonfrogs",
  p_color = "#000000ff",
  p_size = 20,
  filename = "man/figures/logo.png",
  s_x = 1,
  s_y = .75,
  s_width = .51,
  h_fill = "#f1f2f5ff",
)
