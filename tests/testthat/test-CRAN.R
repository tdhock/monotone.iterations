library(testthat)
requireNamespace("monotone.iterations")#load C routines in pkg.
test_that("1 iteration", {
  x <- c(1:4, 3)
  computed <- .C(
    "isoreg_dp_iterations",
    n = as.integer( length(x) ),
    x = as.double( x ),
    w = as.double( rep(1, length(x)) ),
    iterations = as.integer(rep(-1, length(x))),
    PACKAGE = "monotone.iterations")
  expected <- list(
    n=5L,
    x=c(1,2,3,3.5,3.5),
    w=c(1,1,1,2,1),
    iterations=as.integer(c(0,0,0,0,1)))
  expect_identical(computed, expected)
})
