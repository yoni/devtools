\name{system_check}
\alias{system_check}
\title{Runs an R system command with the given arguments and environment.}
\usage{
  system_check(cmd, args = character(), env = character(),
    ...)
}
\arguments{
  \item{cmd}{the command to run}

  \item{args}{a vector of command arguments.}

  \item{env}{a named character vector.  Will be quoted}

  \item{...}{additional arguments to system2}
}
\description{
  Runs an R system command with the given arguments and
  environment.
}

