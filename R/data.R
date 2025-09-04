#' Palettes compatible with colour blindness
#'
#' Colour palettes recommended for use with colour blind audiences.
#'
#' The eight-colour palette is derived from the Obake-Ito palette.
#'
#' Other palettes have been
#'
#' Each other palette is arranged in three groups, intended to achieve
#' perceptual luminance uniformity for deuteranopic viewers
#' (see source for details), from dark to light.
#'
#' For each `cbPalette`, an `altPalette` provides a hue (one of many) that is
#' perceptually indistinguishable for deuteronopic viewers.
#'
#' @format Character vectors
#'
#' @examples
#' par(mfrow = c(4, 1))
#'
#' data("cbPalette8")
#' plot.new()
#' plot.window(xlim = c(1, 8), ylim = c(-1, 1))
#' text(1:8, 1, col = cbPalette8)
#' points(1:8, rep(0, 8), bg = cbPalette8, col = altPalette8,
#'        pch = 22, cex = 2)
#'
#' data("cbPalette12")
#' plot.new()
#' plot.window(xlim = c(1, 12), ylim = c(-1, 1))
#' text(1:12, 1, col = cbPalette12)
#' points(1:12, rep(0, 12), bg = cbPalette12, col = altPalette12,
#'        pch = 22, cex = 2)
#'
#' data("cbPalette15")
#' plot.new()
#' plot.window(xlim = c(1, 15), ylim = c(-1, 1))
#' text(1:15, 1, col = cbPalette15)
#' points(1:15, rep(0, 15), bg = cbPalette15, col = altPalette15,
#'        pch = 22, cex = 2)
#'
#' plot.new()
#' plot.window(xlim = c(1, 25), ylim = c(-1, 1))
#' text(1:24, 1, col = cbPalette24)
#' points(1:24, rep(0, 24), bg = cbPalette24, col = altPalette24,
#'        pch = 22, cex = 2)
#' @source \url{https://mk.bcgsc.ca/colorblind/palettes.mhtml}
#'
#' @seealso
#' The eight-colour Okabe-Ito colour-blind palette is available in base R using
#' `palette.colors(8)`.
#'
#' @keywords datasets
#' @name cbPalettes
NULL

#' @rdname cbPalettes
"cbPalette8"
#' @rdname cbPalettes
"cbPalette12"
#' @rdname cbPalettes
"cbPalette15"
#' @rdname cbPalettes
"cbPalette24"

#' @rdname cbPalettes
"altPalette8"
#' @rdname cbPalettes
"altPalette12"
#' @rdname cbPalettes
"altPalette15"
#' @rdname cbPalettes
"altPalette24"
