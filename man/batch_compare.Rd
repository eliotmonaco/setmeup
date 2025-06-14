% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/batch-compare.R
\name{batch_compare}
\alias{batch_compare}
\title{Pairwise comparisons between list elements}
\usage{
batch_compare(ls)
}
\arguments{
\item{ls}{A list or atomic vector of objects to compare.}
}
\value{
A logical matrix with a number of rows and columns equal to
\code{length(ls)}.
}
\description{
Compare all list elements, producing a logical matrix with the result of each
pairwise comparison. Row and column names are taken from \code{names(ls)}.
}
\examples{
ls <- list(
  var1 = "a",
  var2 = 1,
  var3 = c("a", "b"),
  var4 = 1
)

batch_compare(ls)

}
