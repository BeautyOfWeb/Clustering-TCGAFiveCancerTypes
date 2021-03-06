% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AffinityNetworkFusion.R
\name{ANF}
\alias{ANF}
\title{Fuse affinity networks (i.e., matrices) through one-step or two-step random walk}
\usage{
ANF(Wall, K = 20, weight = NULL, type = c("two-step", "one-step"),
  alpha = c(1, 1, 0, 0, 0, 0, 0, 0), verbose = FALSE)
}
\arguments{
\item{Wall}{a list of affinity matrices of the same shape.}

\item{K}{the number of k nearest neighbors for function kNN_graph}

\item{weight}{a list of non-negative real numbers (which will be 
normalized internally so that it sums to 1) that one-to-one correspond to 
the affinity matrices included in `Wall`. If not set, internally uniform weights 
are assigned to all affinity matrices in `Wall`.}

\item{type}{choose one of the two options: perform "one-step" random walk, 
or "two-step" random walk on the list of affinity matrices in `Wall`` to 
generate a fused affinity matrix. Default: "two-step" random walk}

\item{alpha}{a list of eight non-negative real numbers (which will be normalized
internally to make it sums to 1). Only used when "two-step" (default value 
of `type`) random walk is used. `alpha` is the weights for eight terms in the 
"two-step" random walk formula (check research paper for more explanations about 
the terms). Default value: (1, 1, 0, 0, 0, 0, 0, 0), i.e., only use the 
first two terms (since they are most effective in practice).}

\item{verbose}{Boolean; if true, print some information}
}
\value{
a fused transition matrix (representing a fused network)
}
\description{
Fuse affinity networks (i.e., matrices) through one-step or two-step random walk
}
\examples{
D1 = matrix(runif(400), nrow=20)
W1 = affinity_matrix(D1, 5)
D2 = matrix(runif(400), nrow=20)
W2 = affinity_matrix(D1, 5)
W = ANF(list(W1, W2), K=10)
}
