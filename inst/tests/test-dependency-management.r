context("Dependency Management")

test_that("Package repositories can be retrieved", {
          expect_equal(repositories('simple-dependencies'), c('http://cran.cnr.berkeley.edu', 'http://cran.us.r-project.org'))
})

test_that("Package dependencies can be installed in a specificed library.", {
          pkg <- 'simple-dependencies'
          install_deps(pkg=pkg, lib=tempdir(), repos=repositories(pkg))
})

do_test_bundle <- function(desc, pkg, expected_dependencies) {
  test_that(desc, {
            lib <- bundle_library(pkg)
            bundle(pkg)
            expect_true(file.exists(lib))
            for(dependency in expected_dependencies)
              expect_true(file.exists(file.path(lib, dependency)))
            unlink(lib, recursive=TRUE)
  })
}

do_test_bundle(
               "A package with no dependencies has a bundle directory created, but no dependencies are installed.",
               'no-dependencies',
               c()
               )

do_test_bundle(
               "Package dependencies can be bundled into a user's '.Rbundle' directory within their home directory.",
               "simple-dependencies",
               c('PerformanceAnalytics')
               )
