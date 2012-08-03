#' Bundles a package's dependencies for development workflows.
#'
#' Dependencies are installed into the package's bundle library. See bundle_library.
#' @param pkg package description, can be path or package name.  See
#'   \code{\link{as.package}} for more information
#' @export
bundle <- function(pkg=NULL) {
  lib <- bundle_library(pkg)

  message("Bundling package ", pkg, " dependencies into library ", lib)

  dir.create(lib, recursive=TRUE, showWarnings = FALSE)
  install_deps(pkg=pkg, lib=lib, repos=repositories(pkg))

  invisible()
}
