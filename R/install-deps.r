#' Install a local development package.
#'
#' Uses \code{R CMD INSTALL} to install the package. Will also try to install
#' dependencies of the package from CRAN, if they're not already installed.
#'
#' Installation takes place on a copy of the package produced by 
#' \code{R CMD build} to avoid modifying the local directory in any way.
#'
#' @param pkg package description, can be path or package name.  See
#'   \code{\link{as.package}} for more information
#' @param lib character vector giving the library directories where to
#'        install the packages.  Recycled as needed.  If missing,
#'        defaults to the first element of '.libPaths()'.
#' @param repos character vector, the base URLs of the repositories to use,
#'        e.g., the URL of a CRAN mirror such as "http://cran.us.r-project.org".
#'        Can be 'NULL' to install from local files (with extension
#'        '.tar.gz' for source packages).
#' @export
#' @family package installation
#' @seealso \code{\link{with_debug}} to install packages with debugging flags
#'   set.
#' @importFrom utils install.packages
install_deps <- function(pkg = NULL, lib=NULL, repos=getOption('repos')) {
  pkg <- as.package(pkg)
  deps <- c(
            parse_deps(pkg$depends),
            parse_deps(pkg$imports), 
            parse_deps(pkg$linkingto)
            )
  
  # Do not install packages which are already installed
  not.installed <- function(x) length(find.package(x, lib.loc=lib, quiet = TRUE)) == 0
  deps <- Filter(not.installed, deps)
  
  if (length(deps) == 0) return(invisible())
  
  message("Installing dependencies for ", pkg$package, " into lib ", lib, ":\n",
    paste(deps, collapse = ", "))

  install.packages(pkgs=deps, lib=lib, repos=repos)

  invisible(deps)
}
