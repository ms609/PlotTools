#' Colour to hexadecimal conversion
#'
#' Convert R colour to hexadecimal representation.
#' @inheritParams grDevices::col2rgb
#' @importFrom grDevices col2rgb rgb
#' @examples
#' Col2Hex(1:3)
#' Col2Hex(c("peachpuff", "blue"), TRUE)
#' @template MRS
#' @export
Col2Hex <- function(col, alpha = FALSE) {
  if (alpha) {
    apply(col2rgb(col, alpha), 2, function(x) {
      rgb(x[1], x[2], x[3], x[4], maxColorValue = 255)
    })
  } else {
    apply(col2rgb(col, alpha), 2, function(x) {
      rgb(x[1], x[2], x[3], maxColorValue = 255)
    })
  }
}
