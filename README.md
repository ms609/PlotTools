# PlotTools

[![Project Status: Inactive.](https://www.repostatus.org/badges/latest/inactive.svg)](https://www.repostatus.org/#project-statuses)
[![codecov](https://codecov.io/gh/ms609/PlotTools/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ms609/PlotTools)
[![CRAN Status Badge](https://www.r-pkg.org/badges/version/PlotTools)](https://cran.r-project.org/package=PlotTools)
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/PlotTools)](https://cran.r-project.org/package=PlotTools)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7803390.svg)](https://doi.org/10.5281/zenodo.7803390)


'PlotTools' is an R package that allows the legends for continuous variables
to be added to plots using the familiar functions of the default 'graphics'
package.

Install the latest production version from CRAN using

```r
install.packages("PlotTools")
```

or install the development version from GitHub with

```r
devtools::install_github("ms609/PlotTools")
```

Please let me know of any feature requests or bugs by [opening an 
issue on GitHub](https://github.com/ms609/PlotTools/issues/).

## Example

```r
palette <- if (packageVersion("grDevices") > 3.6) hcl.colors else heat.colors
plot(
  cars,
  xlab = "Speed / mph",
  ylab = "Stopping distance / ft",
  cex = cars$speed / 10,
  col = palette(125 + 1)[cars$dist + 1],
  pch = 16, # Filled circle
  frame.plot = FALSE
)
PlotTools::SpectrumLegend(
  "topleft",
  palette = palette,
  legend = seq(125, 0, length.out = 6),
  title = "Distance",
  bty = "n"
)
PlotTools::SizeLegend(
  "bottomright",
  palette = "darkgrey",
  horiz = TRUE,
  width = c(0, 2.5), scale = "pch",
  legend = seq(0, 25, by = 5),
  x.intersp = 0,
  bty = "n",
  inset = 0.05,
  title = "Speed"
)
```

![image](https://user-images.githubusercontent.com/1695515/232433317-85412267-8c01-41f9-96be-bfc71533d59b.png)

## Citation

Cite this package as:

Smith, Martin R. (2023). _PlotTools: Add continuous legends to plots._
Comprehensive R Archive Network, 
[doi:10.5281/zenodo.7803390](https://dx.doi.org/10.5281/zenodo.7803390).


Please note that the 'PlotTools' project is released with a
[Contributor Code of Conduct](https://ms609.github.io/packages/CODE_OF_CONDUCT.html).
By [contributing](https://ms609.github.io/packages/CONTRIBUTING.html) to this project, you agree to abide by its terms.
