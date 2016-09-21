## Test environments

* Local OS X install, R 3.3.1 & R-devel
* Ubuntu 14.04 (on travis-ci), R 3.3.1, previous rev and R-devel
* Local Windows 10, R 3.3.1 32-bit

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

##

The examples that call out to the Dark Sky API
are in \dontrun blocks and the tests are wrapped 
in a check for CRAN since they need an API key
and that's not going to happen on CRAN. 
The tests are executed with each git push on Travis 
which you can validate from the link in the README.md.
The pkg is also tested with oldrel, current and devel
on Travis.
