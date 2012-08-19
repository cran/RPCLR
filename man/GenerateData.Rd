\name{GenerateData}
\alias{GenerateData}
\title{Simulate a dataset from a 1:1 matched case control study}
\description{
Simulate a dataset from a 1:1 matched case control study
}
\usage{
GenerateData(numstrat, NumType.BM, NumType.NS, mu.diff, rho)
}
\arguments{
  \item{numstrat}{number of matched pairs}
  \item{NumType.BM}{number of features with non-zero difference in means between cases and controls (i.e. biomarkers)}
  \item{NumType.NS}{number of features with identical means between cases and controls (i.e. noise)}
  \item{mu.diff}{Difference in means between cases and controls for biomarkers}
  \item{rho}{correlation between matched pairs for biomarkers only}
}
\details{Biomarkers and noise features are simulated as independent random variables following a Gaussian distribution with unit variance. 
}
\value{
  \item{Data}{a numeric data matrix of n (number of subjects) rows and p (number of features) columns}
  \item{Out}{a response vector of length n of binary indicators of case/control status}
\item{Strat}{a vector of length n of matched pair (stratum) indicators}
}
\references{Balasubramanian, R., Houseman, E. A., Coull, B. A., Lev, M. H., Schwamm, L. H., Betensky, R. A. (2012). Variable importance in matched case-control studies in settings of high dimensional data, Submitted to Biostatistics.}
\author{Raji Balasubramanian}
\seealso{GetVarImp}
\examples{
## Simulate Data
MyDat <- GenerateData(50, 3, 7, 0.5, 0.4)
Dat <- MyDat$Data
Out <- MyDat$Out
Strat <- MyDat$Strat
}
