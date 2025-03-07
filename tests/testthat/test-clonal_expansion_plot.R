source("testdata/SCIP.R")

test_that("The main API works, where retain_axis_scales = F", {
  expect_doppelganger(
    "main_plot",
    clonal_expansion_plot(test_pbmc, test_tcr, verbose = F, clone_scale_factor = 0.5, retain_axis_scales = F, add_size_legend = F))
})

test_that("The API can take in an already-integrated seurat object, where retain_axis_scales = F", {
  expect_doppelganger(
    "main_plot",
    clonal_expansion_plot(test_integrated_pbmc, verbose = F, clone_scale_factor = 0.5, retain_axis_scales = F, add_size_legend = F))
})

test_that("retain_scale() works with verbose = TRUE", {
  expect_doppelganger(
    "scale_retained_main_plot",
    suppressMessages(invisible(
      clonal_expansion_plot(
        test_integrated_pbmc, verbose = T, clone_scale_factor = 0.5, retain_axis_scales = T, add_size_legend = F
        ))))
})

test_that("repulsion and try_place works", {
  expect_doppelganger(
    "repulsed_tight_plot",
      clonal_expansion_plot(
        test_integrated_pbmc, verbose = F, repulse = T, clone_scale_factor = 0.5, retain_axis_scales = F, try_place = T,
        add_size_legend = T, legend_buffer = 1.5, legend_spacing = 0.25
      )
  )
}) 