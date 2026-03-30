## Test environments

* Local PC:
  - Windows 10, R devel

* [GitHub Actions](https://github.com/ms609/PlotTools/actions)
  - Ubuntu 24.04
    - R 4.0
    - R release (tests, examples & vignettes run with valgrind)
    - R devel
  - Mac OS X 10.15.7, R release
  - Microsoft Windows Server 2019 10.0.17763, R release
  - R-hub, windows, macos and linux
  
* `devtools::check_win_devel()`

## R CMD check results

There are no ERRORs or WARNINGs or NOTEs.

## Downstream dependencies

There are currently six reverse dependencies, all of which I maintain.

Reverse dependencies are checked using "revdepcheck" on
[GitHub Actions](https://github.com/ms609/PlotTools/actions/workflows/revdep.yml).
