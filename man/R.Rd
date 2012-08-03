\name{R}
\alias{R}
\title{Runs an R check process in a sandbox environment.}
\usage{
  R(args, path = tempdir(), lib = NA, ...)
}
\arguments{
  \item{args}{passes to system_check}

  \item{path}{within which to run the R process}

  \item{lib}{override R .libPaths}

  \item{...}{arguments passed to system_check}
}
\description{
  Runs an R check process in a sandbox environment.
}

