#' Runs an R check process in a sandbox environment.
#' @param args passes to system_check
#' @param path within which to run the R process
#' @param lib override R .libPaths
#' @param ... arguments passed to system_check
#' @export
R <- function(args, path = tempdir(), lib=NA, ...) {
  r_cmd <- file.path(R.home("bin"), "R")
  
  env <- c(
    "R_ENVIRON_USER" = tempfile(),
    "LC_ALL" = "C", 
    "R_LIBS" = if(is.na(lib)) paste(.libPaths(), collapse = .Platform$path.sep) else lib,
    "CYGWIN" = "nodosfilewarning")
   
  in_dir(path, system_check(cmd=r_cmd, args=args, env=env, ...))
}
