test_that("SpectrumLegend()", {
  skip_if(packageVersion("graphics") < "4.1")
  skip_if(packageVersion("vdiffr") < "1.0")
  vdiffr::expect_doppelganger("SpectrumLegend", function() {

    # Set up blank plot
    plot(0:1, 10:11, asp = 1, type = "n", frame.plot = FALSE,
         xlab = "x", ylab = "y")
    expect_error(SpectrumLegend("bottom", palette = character(0), legend = ""),
                 "palette .* length")
    SpectrumLegend(x = "bottomleft", inset = 0.05,
                   legend = c("Top", "~", "Middle", "", "Bottom"),
                   lwd = 5,
                   palette = hcl.colors(256L, "RdYlBu"),
                   text.col = c("blue", "grey", "brown", "grey", "red"),
                   title = "Big blue title", title.font = 3, title.cex = 1.5)
    SpectrumLegend(x = 0.4, y = 11.0, x.intersp = 2, horiz = TRUE,
                   legend = seq(0, 10, by = 2), palette = 1:10,
                   box.lty = "dashed", box.lwd = 2,
                   box.col = "darkred",
                   # bg = "#eeddcc", # Not yet supported
                   lty = "dotted", lwd = 6, lend = "round",
                   title = "Multi-\nline\ntitle", xpd = NA)
  })
})

test_that("SizeLegend()", {
  skip_if(packageVersion("graphics") < "4.1")
  skip_if(packageVersion("vdiffr") < "1.0")
  vdiffr::expect_doppelganger("SizeLegend", function() {
    # Set up blank plot
    plot(0:1, 10:11, asp = 1, type = "n", frame.plot = FALSE,
         xlab = "x", ylab = "y")

    SizeLegend(x = "bottomleft", inset = 0.05,
               legend = c("Wide", "", "Middle", "", "Narrow"),
               width = c(1, 5),
               col = "darkblue",
               title = "Big blue title", title.font = 3, title.cex = 1.5,
               text.col = c("blue", "brown", "red"),
               xpd = NA)
    expect_warning(SizeLegend(0.4, 10.6, 0.2, 11, abs = TRUE,
               legend = seq(0, 10, by = 2),
               width = 12,
               scale = "pch",
               col = "grey",
               lty = "dotted", pos = 2,
               box.lty = "dashed", box.lwd = 2,
               box.col = "darkred", bg = "#eeddcc",
               lmitre = 2, lend = "round", ljoin = "round",
               title = "Multi-\nline\ntitle", xpd = NA),
               "length two")
    points(0.2, 11, pch = 1, cex = 12, col = "green")
  })
})
