\name{GetVarImp}
\alias{GetVarImp}
\title{To obtain variable importance scores using the R-PCLR algorithm.}
\description{This function outputs variable importance scores based on the R-PCLR algorithm. This is applicable to settings of binary response (case versus control) and can be used to analyze high dimensional data arising from matched case control studies. }
\usage{
GetVarImp(MyData, MyOut, MyStrat, mtry, numBS)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{MyData}{a numeric data matrix of n (number of subjects) rows and p (number of features) columns}
  \item{MyOut}{a response vector of length n of binary indicators of case/control status}
  \item{MyStrat}{a vector of length n of matched pair (stratum) indicators}
  \item{mtry}{Number of covariates to be sampled randomly for inclusion in each model}
  \item{numBS}{Number of bootstrap replicates}
}
\details{The function implements the R-PCLR algoritm. Details are found in the paper referenced below (Balasubramanian, R. et al., 2012). The algorithm utilizes a model-based approach that incorporates a penalized conditional
likelihood, which allows adjustment for the matched design. The penalized conditional logistic regression model incorporates a ridge penalty and is implemented using the ridge() function within the survival library. The penalty parameter is set to the default option in the ridge() function. See Gray, R.J (1992) for details. }
\value{
 A p x 1 vector of variable importance scores.  
}
\references{Balasubramanian, R., Houseman, E. A., Coull, B. A., Lev, M. H., Schwamm, L. H., Betensky, R. A. (2012). Variable importance in matched case-control studies in settings of high dimensional data, Submitted to Biostatistics.

Gray, R. J. (1992). Flexible methods for analyzing survival data using splines, with applications to breast cancer prognosis. Journal of the American Statistical Association, 87, 942-51.}
\author{Raji Balasubramanian}
\seealso{GenerateData, clogit, ridge}
\examples{
## Simulate Data of 100 matched pairs, 3 biomarkers, 5 noise features 
set.seed(1234)
MyDat <- GenerateData(50, 3, 5, 0.5, 0.4)
Dat <- MyDat$Data
Out <- MyDat$Out
Strat <- MyDat$Strat

## Get Variable Importance
MyResults <- GetVarImp(Dat, Out, Strat, mtry=3, numBS=25)

## Print results
hist(MyResults, breaks=6, col="orange", xlab="Importance score", ylab="Number of features", main="Histogram of R-PCLR variable importance scores")
output <- cbind(as.character(colnames(Dat)), format(MyResults, digits=3))
print(output)

## Sort from most important (highest importance score) to least important feature (lowest importance score)
ind <- sort(MyResults, index.return=TRUE, decreasing=TRUE)$ix
output[ind,]


}
