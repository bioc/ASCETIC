% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ascetic.R
\name{asceticCCF}
\alias{asceticCCF}
\title{asceticCCF}
\usage{
asceticCCF(
  dataset,
  ccfDataset,
  regularization = c("aic", "bic"),
  command = "hc",
  restarts = 10
)
}
\arguments{
\item{dataset}{Binary matrix where rows are samples and columns are mutations.
Each cell of the matrix is 1 if the related mutation was observed in the sample; 0 otherwise.
Values reported in the variable named dataset must be consistent with the ones reported in ccfDataset.}

\item{ccfDataset}{Matrix where rows are samples and columns are mutations.
Each cell of the matrix is the cancer cell fraction (CCF) estimated for the related mutation when observed in the sample.
The CCF value is 0 if the mutation was not observed in the sample.
Values reported in ccfDataset must be consistent with the ones reported in dataset.}

\item{regularization}{Regularization to be used for the maximum likelihood estimation.
Possible values are aic for the Akaike information criterion and bic for the Bayesian information criterion.
For the complete list of options, we refer to the manual of the bnlearn package.}

\item{command}{Optimization technique to be used for maximum likelihood estimation.
Valid values are either hc for Hill Climbing or tabu for Tabu Search.}

\item{restarts}{Number of restarts to be performed during the maximum likelihood estimation when Hill Climbing optimization technique is used.
Higher values lead to improved estimates, but require higher computational burden; default value is 10.
This parameter is ignored if tabu search is selected.}
}
\value{
A list of 4 elements: 1) dataset, input dataset.
                              2) ccfDataset, input ccfDataset.
                              3) poset, partially order set among mutations estimated by ASCETIC from the agony ranking.
                              4) inference, inferred ASCETIC evolutionary model for each selected regularization.
}
\description{
Perform the ASCETIC inference framework on single samples (using CCF) datasets.
}
\examples{
set.seed(12345)
data(datasetExampleSingleSamples)
data(ccfDatasetExampleSingleSamples)
resExampleSingleSamples <- asceticCCF(
                              dataset = datasetExampleSingleSamples,
                              ccfDataset = ccfDatasetExampleSingleSamples,
                              regularization = "aic",
                              command = "hc",
                              restarts = 0 )

}
