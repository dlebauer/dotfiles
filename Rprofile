.First <- function() {
  options(
    repos = c(CRAN = "https://cran.rstudio.com/")
#    browserNLdisabled = TRUE#,
#    error = browser,
#    deparse.max.lines = 2
)
  .libPaths(c("~/R/library/"))
}
# Override q() to not save by default.
# Same as saying q("no")
q <- function (save="no", ...) {
    quit(save=save, ...)
}    

if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(testthat))	
}





