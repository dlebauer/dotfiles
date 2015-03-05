# hard code the US repo for CRAN
r <- getOption("repos")             
r["CRAN"] <- "http://cran.us.r-project.org"
options(repos = r)
rm(r)

# Override q() to not save by default.
# Same as saying q("no")
q <- function (save="yes", ...) {
  quit(save=save, ...)
}

