#' Loads a package's specified repositories.
#' @param pkg package description, can be path or package name.  See
#'   \code{\link{as.package}} for more information
#' @export
repositories <- function(pkg=NULL) {
  pkg <- as.package(pkg)
  strsplit(pkg$repositories, "\n")[[1]]
}
