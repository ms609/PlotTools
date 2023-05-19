## Test environments

* Local PC:
  - Windows 10, R Under development (2023-03-28 r84109 ucrt)

* [GitHub Actions](https://github.com/ms609/PlotTools/actions)
  - Ubuntu 20.04
    - R 3.5.0
    - R release (tests, examples & vignettes run with valgrind)
    - R devel
  - Mac OS X 10.15.7, R release
  - Microsoft Windows Server 2019 10.0.17763, R release
  
* R-hub, with `rhub::check_for_cran()` and `devtools::check_win_devel()`

## R CMD check results

There are no ERRORs or WARNINGs or NOTEs.

## Downstream dependencies

There are currently four reverse dependencies, all of which I maintain.

Reverse dependencies are checked using "revdepcheck" on
[GitHub Actions](https://github.com/ms609/PlotTools/actions/workflows/revdep.yml).
