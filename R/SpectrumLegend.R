#' Produce a legend for continuous gradient scales
#'
#' Prints an annotated vertical bar coloured according to a continuous palette.
#'
#' This convenience function is not yet very customizable; do file a GitHub
#' issue if you would value additional functionality.
#'
#' Note that the `bg` parameter to specify the background colour for the legend
#' box is not presently supported in vertical legends.
#' For use in vertical legends, open a [GitHub issue](
#' https://github.com/ms609/PlotTools/issues/new).
#'
#' @param legend Character vector with which to label points on `palette`.
#' Note that, in a vertical legend, values will be printed from top down;
#' use [`rev()`] to reverse the order.
#' @param palette Colour palette to depict.
#' Specify either a vector of colours, or a function such that `palette(n)`
#' returns a vector of _n_ colours.
#' @param lwd,lty,lend Additional parameters to [`segments()`],
#' controlling line style.  Use `lend = "butt"` (the default) if `palette` is
#' semitransparent, to avoid artefacts.
#' @param cex Character expansion factor relative to current `par("cex")`.
#' @param bty Character specifying the type of box to be drawn around the
#' legend. The allowed values are `"o"` (the default) and `"n"`.
#' @param x,horiz,adj,seg.len,\dots Additional parameters to [`legend()`].
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
#'
#' SpectrumLegend("bottomright", legend = c("Bright", "Middle", "Dark"),
#'                palette = hcl.colors(32L), lwd = 5,
#'                inset = 0.05, # Inset from plot margin
#'                title = "Brightness")
#' SpectrumLegend("topright", horiz = TRUE,
#'                legend = seq(1, 9, by = 2), palette = 1:8)
#' @template MRS
#' @importFrom graphics legend par rect segments xyinch
#' @importFrom grDevices xy.coords
#' @export
SpectrumLegend <- function(
  x = "topright", ...,
  palette,
  legend,
  lty = 1, lwd = 4,
  bty = "o",
  adj = if (horiz) c(0.5, 0.5) else c(0, 0.5),
  horiz = FALSE,
  lend = "butt",
  cex = 1,
  seg.len = 1
) {
  if (is.function(palette)) {
    palette <- palette(256)
  }
  nCol <- length(palette)
  if (nCol < 1) {
    stop("palette has length zero")
  }

  lgd <- legend(x = x,
                legend = legend,
                horiz = horiz,
                adj = adj,
                cex = cex,
                bty = ifelse(horiz, "n", bty),
                lty = 0, ncol = 1,
                seg.len = seg.len,
                ...)
  textXY <- lgd$text

  Cex <- cex * par("cex")
  xyc <- xyinch(par("cin"), warn.log = FALSE)

  if (horiz) {
    xEnds <- range(textXY$x)
    yc <- Cex * xyc[2L]
    barSpace <- yc
    yEnds <- textXY$y[c(1, 1)] - barSpace

    lgd$rect$left <- lgd$rect$left + (barSpace / 2) # as not plotting lines
    lgd$rect$top <- lgd$rect$top
    lgd$rect$h <- lgd$rect$h + barSpace

    if (bty == "o") {
      box <- lgd$rect
      dots <- list(...)
      rect(box$left, box$top - box$h,
           box$left + box$w, box$top,
           # col = dots$bg, # TODO not supported - overprints text
           lwd = dots$box.lwd, lty = dots$box.lty,
           border = dots$box.col)
    }
  } else {
    xc <- Cex * xyc[1L]
    xEnds <- textXY$x[c(1, 1)] - xc - (xc * seg.len / 2)
    yEnds <- range(textXY$y)
  }

  segX <- xEnds[1] + ((xEnds[2] - xEnds[1]) * 0:nCol / nCol)
  segY <- yEnds[1] + ((yEnds[2] - yEnds[1]) * 0:nCol / nCol)

  nPlus1 <- nCol + 1L
  # Create overlap to avoid hairline gaps in SVG render
  epsilon <- 0.004
  epsX <- abs(segX[nPlus1] - segX[1]) * epsilon
  epsY <- abs(segY[nPlus1] - segY[1]) * epsilon
  segments(segX[-nPlus1], segY[-nPlus1],
           segX[-1] + epsX, segY[-1] + epsY,
           col = palette,
           lwd = lwd, lty = lty, lend = lend)

  # Return:
  invisible(lgd)
}

#' @rdname SpectrumLegend
#' @param width Vector of length two specifying width of legend bar at base
#' and top.
#' @param scale Character string specifying whether `width = 1` corresponds to:
#' `"pch"`, the size of a plotting symbol with `pch = 1`;
#' `"lwd"`, the width of a line with `lwd = 1`.
#' @param col Colour used for the width bar.
#' @examples
#' SizeLegend(
#'   "topleft", inset = 0.05, width = c(0, 2),
#'   title = "Width",
#'   legend = c("max", ".", ".", "min"),
#'   palette = topo.colors, # Associate with a colour scale
#'   y.intersp = 1.5 # Vertical space between labels (also moves title)
#' )
#' SizeLegend(
#'   "bottomleft", horiz = TRUE, width = c(4, 1),
#'   legend = c("Thick", "Thin"), palette = "darkred",
#'   inset = 0.06 # Make space for the bar.
#'                # A future release may calculate this automatically
#' )
#' @export
SizeLegend <- function(
  x = "topright", ...,
  legend = character(0),
  width = c(0, 1),
  palette = par("col"),
  scale = c("pch", "lwd"),
  lty = 0, lwd = 4,
  bty = "o",
  adj = if (horiz) c(0.5, 0.5) else c(0, 0.5),
  horiz = FALSE,
  lend = "butt",
  cex = 1,
  seg.len
) {

  if (length(width) < 2) {
    warning("`width` should be a vector of length two")
    width <- c(0, width)
  }
  lwdToPch <- 7.18
  lineScale <- switch(pmatch(tolower(scale[1]), c("pch", "lwd")), lwdToPch, 1)
  lwd <- lineScale * width

  Cex <- cex * par("cex")
  xyc <- xyinch(par("cin"), warn.log = FALSE)
  xchar <- Cex * xyc[1L]
  if (missing(seg.len)) {
    seg.len <- max(lwd) / lwdToPch / 2
  }
  if (horiz) {
    yc <- Cex * xyc[2L]
    barSpace <- yc * (seg.len + 1)
  }

  lgd <- legend(x = x,
                legend = legend,
                horiz = horiz,
                adj = adj,
                cex = cex,
                bty = ifelse(horiz, "n", bty),
                lty = if (horiz) 0 else 1, ncol = 1,
                col = par("bg"),
                seg.len = if (horiz) 0 else seg.len,
                ...)
  textXY <- lgd$text


  if (horiz) {
    xEnds <- range(textXY$x)
    yEnds <- textXY$y[c(1, 1)] - yc - (yc * seg.len / 2)

    lgd$rect$top <- lgd$rect$top
    lgd$rect$h <- lgd$rect$h + barSpace

    if (bty == "o") {
      box <- lgd$rect
      dots <- list(...)
      rect(box$left, box$top - box$h,
           box$left + box$w, box$top,
           # col = dots$bg, # TODO not supported - overprints text
           lwd = dots$box.lwd, lty = dots$box.lty,
           border = dots$box.col)
    }
  } else {
    xEnds <- textXY$x[c(1, 1)] - xchar - (xchar * seg.len / 2)
    yEnds <- range(textXY$y)
  }

  if (is.function(palette)) {
    palette <- palette(256)
  }
  nCol <- length(palette)
  resolution <- if (nCol > 1) nCol else 256
  segX <- xEnds[1] + ((xEnds[2] - xEnds[1]) * 0:resolution / resolution)
  segY <- yEnds[1] + ((yEnds[2] - yEnds[1]) * 0:resolution / resolution)


  nPlus1 <- resolution + 1L
  # Create overlap to avoid hairline gaps in SVG render
  epsilon <- 0.004
  epsX <- abs(segX[nPlus1] - segX[1]) * epsilon
  epsY <- abs(segY[nPlus1] - segY[1]) * epsilon
  segments(segX[-nPlus1], segY[-nPlus1],
           segX[-1] + epsX, segY[-1] + epsY,
           col = palette,

           lwd = seq(lwd[1], lwd[2], length.out = resolution), lend = lend)

  # Return:
  invisible(lgd)
}
