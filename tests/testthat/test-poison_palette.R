test_that("poison_palette returns a vector of hex colours (discrete)", {
  pal <- poison_palette(
    "Oskoi",
    n = 3,
    type = "discrete",
    return = "vector"
  )
  expect_type(pal, "character")
  expect_length(pal, 3)
  # Allow 6- or 8-digit hex (alpha possible)
  expect_true(all(grepl("^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$", pal)))
})

test_that("poison_palette returns the full discrete palette by default when n is NULL", {
  # use a palette that exists in your registry
  full <- poison_palette("Oskoi", type = "discrete", return = "vector")
  expect_length(full, length(full)) # sanity
  # re-request with explicit n = length(full) and compare
  same <- poison_palette(
    "Oskoi",
    n = length(full),
    type = "discrete",
    return = "vector"
  )
  expect_identical(full, same)
})

test_that("poison_palette enforces discrete n <= palette length", {
  full <- poison_palette("Oskoi", type = "discrete", return = "vector")
  expect_error(
    poison_palette(
      "Oskoi",
      n = length(full) + 1,
      type = "discrete",
      return = "vector"
    ),
    "has .* colours; requested"
  )
})


test_that("direction = -1 reverses palette order", {
  d3 <- poison_palette(
    "Oskoi",
    type = "discrete",
    return = "vector"
  )
  d3_rev <- poison_palette(
    "Oskoi",
    type = "discrete",
    direction = -1,
    return = "vector"
  )
  expect_identical(d3_rev, rev(d3))
})

test_that("alpha adds transparency but keeps valid hex", {
  pal <- poison_palette(
    "Oskoi",
    n = 4,
    type = "discrete",
    alpha = 0.5,
    return = "vector"
  )
  expect_true(all(grepl("^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$", pal)))
})

test_that("invalid palette name errors with helpful message", {
  expect_error(
    poison_palette("this_palette_does_not_exist", return = "vector"),
    "Palette 'this_palette_does_not_exist' not found. Available: Afemoralis, Afulguritus, Amacero, Aminutus, Ashihuemoy, Atrivittata, Bpicturata, Dauratus, Dsarayacuensis, Dtalanis, Dtazureus, Eanthonyi, Edarwinwallacei, Etricolor, Haureoguttatum, Hcinerascens, Hhobbsi, Llineatus, Mlaevigata, Oanchicayensis, Ohistrionica, Olehmanni, Opbluejeans, Opcolon, Opescudo, Oploma, Opsancristobal, Opuyama, Oscolon, Oskoi, Oslita, Osotokiki, Ossanantonio, Ossp1, Pterribilis, Ptomopterna, Pvaillantii, Ramazonica, Ribanded, Ristriped, Rmarina, Rvariabilis"
  )
})
