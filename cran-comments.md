## Test environments

* Local OS X install, R 3.4.1 
* Ubuntu 14.04 (on travis-ci), R oldre, release, devel
* WinBuilder, rhub Windows

## R CMD check results

0 errors | 0 warnings | 0 notes

* This is a maintenance release.

## Reverse dependencies

None

##

Removed the dplyr dependency and made date parameters more 
flexible. Tests and examples do not run on CRAN because they
require an API key. Tests run on Travis and Appveyor.
