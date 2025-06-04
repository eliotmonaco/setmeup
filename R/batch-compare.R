#' Pairwise comparisons between list elements
#'
#' @description
#' Compare all list elements, producing a logical matrix with the result of each
#' pairwise comparison. Row and column names are taken from `names(ls)`.
#'
#' @param ls A list or atomic vector of objects to compare.
#'
#' @returns A logical matrix with a number of rows and columns equal to
#' `length(ls)`.
#' @export
#'
#' @examples
#' ls <- list(
#'   var1 = "a",
#'   var2 = 1,
#'   var3 = c("a", "b"),
#'   var4 = 1
#' )
#'
#' batch_compare(ls)
#'
batch_compare <- function(ls) {
  if (!is.vector(ls)) {
    stop("`ls` is not a list or atomic vector")
  }

  tf <- lapply(ls, \(x) {
    lapply(ls, \(y) {
      isTRUE(all.equal(x, y))
    })
  })

  matrix(
    do.call(cbind, lapply(tf, unlist)),
    nrow = length(ls), ncol = length(ls),
    dimnames = list(names(ls), names(ls))
  )
}
