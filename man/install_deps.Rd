\name{install_deps}
\alias{install_deps}
\title{Install a local development package.}
\usage{
  install_deps(pkg = NULL, lib = NULL,
    repos = getOption("repos"))
}
\arguments{
  \item{pkg}{package description, can be path or package
  name.  See \code{\link{as.package}} for more information}

  \item{lib}{character vector giving the library
  directories where to install the packages.  Recycled as
  needed.  If missing, defaults to the first element of
  '.libPaths()'.}

  \item{repos}{character vector, the base URLs of the
  repositories to use, e.g., the URL of a CRAN mirror such
  as "http://cran.us.r-project.org".  Can be 'NULL' to
  install from local files (with extension '.tar.gz' for
  source packages).}
}
\description{
  Uses \code{R CMD INSTALL} to install the package. Will
  also try to install dependencies of the package from
  CRAN, if they're not already installed.
}
\details{
  Installation takes place on a copy of the package
  produced by \code{R CMD build} to avoid modifying the
  local directory in any way.
}
\seealso{
  \code{\link{with_debug}} to install packages with
  debugging flags set.

  Other package installation: \code{\link{install}},
  \code{\link{install_bitbucket}},
  \code{\link{install_github}},
  \code{\link{install_gitorious}},
  \code{\link{install_url}}, \code{\link{install_version}}
}

