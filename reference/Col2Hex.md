# Colour to hexadecimal conversion

Convert R colour to hexadecimal representation.

## Usage

``` r
Col2Hex(col, alpha = FALSE)
```

## Arguments

- col:

  vector of any of the three kinds of R color specifications, i.e.,
  either a color name (as listed by
  [`colors()`](https://rdrr.io/r/grDevices/colors.html)), a hexadecimal
  string (see Details), or a positive integer `i` meaning
  [`palette`](https://rdrr.io/r/grDevices/palette.html)`()[i]`.

- alpha:

  logical value indicating whether the alpha channel (opacity) values
  should be returned.

## Author

[Martin R. Smith](https://orcid.org/0000-0001-5660-1727)
(<martin.smith@durham.ac.uk>)

## Examples

``` r
Col2Hex(1:3)
#> [1] "#000000" "#DF536B" "#61D04F"
Col2Hex(c("peachpuff", "blue"), TRUE)
#> [1] "#FFDAB9FF" "#0000FFFF"
```
