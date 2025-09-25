## code to prepare `poison_frogs_palettes` dataset goes here

library(palettes)

frog_palettes <- pal_palette(
  oophaga_pumilio_bocas = c("#d7191c", "#2c7bb6", "#fdae61", "#abd9e9"),
  dendrobates_tinctorius_azureus = c(
    "#0B1D51",
    "#1F3B99",
    "#4F7CEB",
    "#A0B8FF"
  ),
  phyllobates_terribilis = c("#FFD100", "#333333")
)
frog_palettes


frog_palettes[[2]]

usethis::use_data(poison_frog_palettes, overwrite = TRUE)
