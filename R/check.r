#' Build and check a package, cleaning up automatically on success.
#'
#' \code{check} automatically builds a package before using \code{R CMD check}
#' as this is the recommended way to check packages.  Note that this process
#' runs in an independent realisation of R, so nothing in your current 
#' workspace will affect the process.
#'
#' @param pkg package description, can be path or package name.  See
#'   \code{\link{as.package}} for more information
#' @param document if \code{TRUE} (the default), will update and check
#'   documentation before running formal check.
#' @param cleanup if \code{TRUE} the check directory is removed if the check
#'   is successful - this allows you to inspect the results to figure out what
#'   went wrong. If \code{FALSE} the check directory is never removed.
#' @param cran if \code{TRUE} (the default), check with CRAN.
#' @param args An optional character vector of additional command line
#'   arguments to be passed to \code{R CMD check}.
#' @param bundle whether to bundle dependencies in a separate library
#'        as opposed to using the system-wide libraries.
#' @export
check <- function(
                  pkg = NULL,
                  document = TRUE,
                  bundle = TRUE,
                  cleanup = TRUE,
                  cran = TRUE,
                  args = NULL
                  ) {
  pkg <- as.package(pkg)
  
  if (document)
    document(pkg, clean = TRUE)

  if(bundle)
    bundle(pkg)

  message("Checking ", pkg$package)

  built_path <- build(pkg, tempdir())  
  on.exit(unlink(built_path))


  opts <- "--timings"
  if (cran)
    opts <- c(opts, "--as-cran")

  opts <- paste(paste(opts, collapse = " "), paste(args, collapse = " "))
  
  r_args <- paste("CMD check ", shQuote(built_path), " ", opts, sep = "")
  R(args=r_args, path=tempdir(), lib=bundle_library(pkg))
  
  check_path <- file.path(tempdir(), paste(pkg$package, ".Rcheck", sep = ""))
  if (cleanup) {
    unlink(check_path, recursive = TRUE)    
  } else {
    message("Check results in ", check_path)
  }

  invisible(TRUE)
}


