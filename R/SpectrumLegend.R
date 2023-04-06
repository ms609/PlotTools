#' Produce a legend for continuous gradient scales
#'
#' Prints an annotated vertical bar coloured according to a continuous palette.
#'
#' This convenience function is not yet very customizable; do file a GitHub
#' issue if you would value additional functionality.
#'
#' @param x0,y0,x1,y1 Coordinates of the bottom-left and top-right end of the
#' bar.
#' @param absolute Logical specifying whether `x` and `y` values denote
#' coordinates (`TRUE`) or relative position, where (0, 0) denotes the
#' bottom-left of the plot area and (1, 1) the top right.
#' @param legend Character vector with which to label points on `palette`.
#' @param palette Colour palette to depict.
#' @param lwd,lty,lend Additional parameters to [`segments()`],
#' controlling line style.
#' @param cex Character expansion factor relative to current `par("cex")`.
#' @param bty Character specifying the type of box to be drawn around the
#' legend. The allowed values are `"o"` (the default) and `"n"`.
#' @param bg The background colour for the legend box. (Note that this is used only if `bty != "n"`.)
#' @param box.lty,box.lwd,box.col The line type, width and colour for the legend box (if `bty = "o"`).
#' @param text.col Colour used for the legend text.
#' @param font,text.font Font used for the legend text; see [`text()`].
#' @param title Text to display
#' @param title.col Colour for title; defaults to `text.col[1]`.
#' @param title.cex Expansion factor(s) for the title, defaults to `cex[1]`.
#' @param title.adj Horizontal adjustment for title: see the help for
#' `par("adj")`.
#' @param title.font Font used for the legend title.
#' @param pos,\dots Additional parameters to [`text()`].
#'
#' @returns A list, returned invisibly, with components:
#' - `rect` A list with components:
#'   - `w`, `h`: positive numbers giving *w*idth and *h*eight of the
#'     legend's box.
#'   - `left`, `top`: x and y coordinates of the upper left corner of the
#'     box.
#' - `text`: A list with components `x`, `y`, numeric vectors of length
#'   `length(legend)`, giving the x and y coordinates of the legend's text(s).
#'
#' @examples
#' plot(0:1, 0:1, type = "n", frame.plot = FALSE,
#'      xlab = "x", ylab = "y")
#' SpectrumLegend(legend = c("Dark", "Middle", "Bright"),
#'                palette = hcl.colors(32L), lwd = 5,
#'                title = "Brightness")
#' SpectrumLegend(0.4, 0.95, 0.9, 0.95, abs = TRUE,
#'                legend = seq(1, 9, by = 2), palette = 1:8, pos = 1)
#' @template MRS
#' @importFrom graphics par segments strheight strwidth text
#' @export
SpectrumLegend <- function(x0 = 0.05, y0 = 0.05,
                           x1 = x0, y1 = y0 + 0.2,
                           absolute = FALSE,
                           legend = character(0), palette,
                           lty = 1, lwd = 4,
                           bty = "o", bg = par("bg"),
                           box.lwd = par("lwd"),
                           box.lty = par("lty"),
                           box.col = par("fg"),
                           lend = "square", cex = 1,
                           text.col = par("col"),
                           font = NULL, text.font = font,
                           title = NULL, title.col = text.col[1],
                           title.cex = cex[1],
                           title.adj = 0.5,
                           title.font = text.font[1],
                           pos = 4,
                           ...) {
  nCol <- length(palette)

  if (!absolute) {
    corners <- par("usr") # x0 x1 y0 y1
    xRange <- corners[2] - corners[1]
    yRange <- corners[4] - corners[3]

    # Order is important: lazy evaluation will set x1 = modified x0
    x1 <- corners[1] + (x1 * xRange)
    x0 <- corners[1] + (x0 * xRange)
    y1 <- corners[3] + (y1 * yRange)
    y0 <- corners[3] + (y0 * yRange)
  }

  segX <- x0 + ((x1 - x0) * 0:nCol / nCol)
  segY <- y0 + ((y1 - y0) * 0:nCol / nCol)

  nPlus1 <- nCol + 1L
  segments(segX[-nPlus1], segY[-nPlus1],
           segX[-1], segY[-1],
           col = palette,
           lwd = lwd, lty = lty, lend = lend,
           ...)
  textX <- seq(x0, x1, length.out = length(legend))
  textY <- seq(y0, y1, length.out = length(legend))
  text(textX, textY,
       col = text.col,
       cex = cex,
       font = text.font,
       legend, pos = pos, ...)
  if (!is.null(title)) {
    text(mean(x0, x1) + (max(strwidth(legend)) / ifelse(pos == 2, -2, 2)),
         max(y0, y1) + prod(
           par("lheight"),
           strheight("")
         ),
         title,
         pos = 3,
         cex = title.cex, adj = title.adj, font = title.font, col = title.col,
         ...)
  }

  # Return:
  invisible(list(
    rect = list(),
    text = list(x = textX, y = textY))
  )
}

#' @rdname SpectrumLegend
#' @param width Vector of length two specifying width of legend bar at base
#' and top.
#' @param scale Character string specifying whether `width = 1` corresponds to:
#' `"pch"`, the size of a plotting symbol with `pch = 1`;
#' `"lwd"`, the width of a line with `lwd = 1`.
#' @param col Colour used for the width bar.
#' @examples
#' SizeLegend(0.8, title = "Width", legend = c("min", "max"))
#' @export
SizeLegend <- function(x0 = 0.05, y0 = 0.05,
                       x1 = x0, y1 = y0 + 0.2,
                       absolute = FALSE,
                       legend = character(0),
                       width = c(0, 1),
                       scale = c("pch", "lwd"),
                       lend = "square",
                       bty = "o", bg = par("bg"),
                       box.lwd = par("lwd"),
                       box.lty = par("lty"),
                       box.col = par("fg"),
                       cex = 1,
                       col = par("col"),
                       text.col = par("col"),
                       font = NULL, text.font = font,
                       title = NULL, title.col = text.col[1],
                       title.cex = cex[1],
                       title.adj = 0.5,
                       title.font = text.font[1],
                       pos = 4,
                       ...) {

  if (!absolute) {
    corners <- par("usr") # x0 x1 y0 y1
    xRange <- corners[2] - corners[1]
    yRange <- corners[4] - corners[3]

    # Order is important: lazy evaluation will set x1 = modified x0
    x1 <- corners[1] + (x1 * xRange)
    x0 <- corners[1] + (x0 * xRange)
    y1 <- corners[3] + (y1 * yRange)
    y0 <- corners[3] + (y0 * yRange)
  }

  resolution <- 100
  segX <- x0 + ((x1 - x0) * 0:resolution / resolution)
  segY <- y0 + ((y1 - y0) * 0:resolution / resolution)
  if (length(width) < 2) {
    warning("`width` should be a vector of length two")
    width <- c(0, width)
  }
  lwd <- switch(pmatch(tolower(scale[1]), c("pch", "lwd")),
                100 / 14, 1) * width

  nPlus1 <- resolution + 1L
  segments(segX[-nPlus1], segY[-nPlus1],
           segX[-1], segY[-1],
           col = col,
           lwd = seq(lwd[1], lwd[2], length.out = resolution), lend = lend,
           ...)
  textX <- seq(x0, x1, length.out = length(legend))
  textY <- seq(y0, y1, length.out = length(legend))
  text(textX, textY,
       col = text.col,
       cex = cex,
       font = text.font,
       legend, pos = pos, ...)
  if (!is.null(title)) {
    text(mean(x0, x1) + (max(strwidth(legend)) / ifelse(pos == 2, -2, 2)),
         max(y0, y1) + prod(
           par("lheight"),
           strheight("")
         ),
         title,
         pos = 3,
         cex = title.cex, adj = title.adj, font = title.font, col = title.col,
         ...)
  }

  # Return:
  invisible(list(
    rect = list(),
    text = list(x = textX, y = textY))
  )
}
