#' Runs an R system command with the given arguments and environment.
#' @param cmd the command to run
#' @param args a vector of command arguments.
#' @param env a named character vector.  Will be quoted
#' @param ... additional arguments to system2
#' @export
system_check <- function(cmd, args = character(), env = character(), ...) {

  with_env(env, {
    res <- system2(cmd, args = args, ...)
  })
  if (res != 0) {
    stop("Command failed (", res, ")", call. = FALSE)
  }
  
  invisible(TRUE)
}
