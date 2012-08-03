#' Generates a path to a package's bundle library.
#' @param pkg the path to the package
#' @return path to a package's bundle library
#' @export
bundle_library <- function(pkg='.') {
  pkg <- as.package(pkg)
  file.path(path.expand("~"), '.Rbundle', pkg$package)
}
