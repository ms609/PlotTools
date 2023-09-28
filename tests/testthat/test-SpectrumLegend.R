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
                   palette = function(n) hcl.colors(n, "RdYlBu", alpha = 0.7),
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

test_that("Vertical SizeLegend()", {
  skip_if(packageVersion("graphics") < "4.1")
  skip_if(packageVersion("vdiffr") < "1.0")
  vdiffr::expect_doppelganger("SizeLegend-v", function() {
    # Set up blank plot
    plot(0:1, 10:11, asp = 1, type = "n", frame.plot = FALSE,
         xlab = "x", ylab = "y")

    SizeLegend(x = "bottomleft", inset = 0.05,
               legend = c("Narrow", "", "Middle", "", "Wide"),
               width = c(5, 1),
               palette = "darkblue",
               title = "Big blue title", title.font = 3, title.cex = 1.5,
               text.col = c("blue", "grey", "brown", "darkgrey", "red"),
               xpd = NA)
    big <- 12
    expect_warning(
      val <- SizeLegend(x = 0.4, y = 11, legend = seq(10, 0, by = -2),
                        width = big,
                        scale = "pch",
                        palette = rainbow,
                        lty = "dotted",
                        box.lty = "dashed", box.lwd = 2,
                        box.col = "darkred",
                        y.intersp = 2,
                        # bg = "#eeddcc", # TODO - see SpectrumLegend above
                        lend = "round",
                        title = "Multi-\nline\ntitle", xpd = NA),
      "length two"
    )

    xc <- xyinch(par("cin"))[1]
    points(val$text$x[1] - xc - (xc * (big / 4)), val$text$y[1],
           pch = 1, cex = big, col = "darkgreen")
  })
})

test_that("Horizontal SizeLegend()", {
  skip_if(packageVersion("graphics") < "4.1")
  skip_if(packageVersion("vdiffr") < "1.0")
  vdiffr::expect_doppelganger("SizeLegend-h", function() {
    # Set up blank plot
    plot(0:1, 10:11, asp = 1, type = "n", frame.plot = FALSE,
         xlab = "x", ylab = "y")

    SizeLegend(
      horiz = TRUE, width = c(1, 4),
      x = "top", inset = 0.05,
      title = "Horizontal",
      legend = c("Left", "Middle", "Right"),
      palette = function(n) hcl.colors(n, "RdYlBu"),
      text.col = c("blue", "brown", "red")
    )

    SizeLegend(
      horiz = TRUE, width = c(4, 1),
      x = "bottom", inset = 0.05,
      legend = c("Left", "Middle", "Right"),
      text.font = 2:4,
      palette = function(n) hcl.colors(n, "RdYlBu"),
      bty = "n"
    )
  })
})
