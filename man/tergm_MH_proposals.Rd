\name{tergm_MH_proposals}
\alias{tergm_MH_proposals}
\alias{InitMHP}
\alias{InitMHP.dissolution}
\alias{InitMHP.dissolutionTNT}
\alias{InitMHP.dissolutionMLE}
\alias{InitMHP.dissolutionNonObservedMLE}
\alias{InitMHP.formation}
\alias{InitMHP.formationMLE}
\alias{InitMHP.formationMLETNT}
\alias{InitMHP.formationNonObservedMLE}
\alias{InitMHP.formationTNT}
\alias{InitMHP.dissolutionMLEblockdiag}
\alias{InitMHP.dissolutionNonObservedMLEblockdiag}
\alias{InitMHP.formationMLEblockdiag}
\alias{InitMHP.formationMLEblockdiagTNT}
\alias{InitMHP.formationNonObservedMLEblockdiag}
\alias{InitMHP.dissolutionMLETNT}
\alias{InitMHP.dissolutionMLEblockdiagTNT}
\alias{InitMHP.dissolutionNonObservedMLETNT}
\alias{InitMHP.dissolutionNonObservedMLEblockdiagTNT}
\alias{InitMHP.formationNonObservedMLETNT}
\alias{InitMHP.formationNonObservedMLEblockdiagTNT}



\docType{methods}

\title{Metropolis-Hastings Proposal Methods for TERGM MCMC}
\description{
  \code{\link{tergm}}  uses a Metropolis-Hastings (MH) algorithm provided by \code{\link{ergm}} to control the behavior of the Markov Chain Monte Carlo (MCMC) for sampling networks.  The MCMC chain is intended to step around the sample space of possible networks, selecting a network at regular intervals to evaluate the statistics in the model.  For each MCMC step, \eqn{n} (\eqn{n=1} in the simple case) toggles are proposed to change the dyad(s) to the opposite value. The probability of accepting the proposed change is determined by the MH acceptance ratio.  The role of the different MH methods implemented in \code{\link{tergm}} is to vary how the sets of dyads are selected for toggle proposals.  This is used in some cases to improve the performance (speed and mixing) of the algorithm, and in other cases to constrain the sample space.}
  
\details{

\subsection{MH proposal methods implemented in the \code{\link[=tergm-package]{tergm}} package}{
  

  TODO: EXPLAIN TERGM PROPOSAL TYPES HERE
  \itemize{
    \item{InitMHP.dissolution}{}
    \item{InitMHP.dissolutionTNT}{}
    \item{InitMHP.dissolutionMLE}{}
    \item{InitMHP.dissolutionNonObservedMLE}{}
    \item{InitMHP.formation}{}
    \item{InitMHP.formationMLE}{}
    \item{InitMHP.formationMLETNT}{}
    \item{InitMHP.formationNonObservedMLE}{}
    \item{InitMHP.formationTNT}{}
    \item{InitMHP.dissolutionMLEblockdiag}{}
    \item{InitMHP.dissolutionNonObservedMLEblockdiag}{}
    \item{InitMHP.formationMLEblockdiag}{}
    \item{InitMHP.formationMLEblockdiagTNT}{}
    \item{InitMHP.formationNonObservedMLEblockdiag}{}
    \item{InitMHP.dissolutionMLETNT}{}
    \item{InitMHP.dissolutionMLEblockdiagTNT}{}
    \item{InitMHP.dissolutionNonObservedMLETNT}{}
    \item{InitMHP.dissolutionNonObservedMLEblockdiagTNT}{}
    \item{InitMHP.formationNonObservedMLETNT}{}
    \item{InitMHP.formationNonObservedMLEblockdiagTNT}{}
   }
    
}

}

\seealso{\code{\link[=tergm-package]{tergm}} package, \code{\link{ergm}}, \code{\link{ergm-constraints}}, and ergm's  \code{\link[ergm]{MHproposal}} help page}


\references{
  
  Goodreau SM, Handcock MS, Hunter DR, Butts CT, Morris M (2008a).
  A \pkg{statnet} Tutorial.
  \emph{Journal of Statistical Software}, 24(8).
  \url{http://www.jstatsoft.org/v24/i08/}.
  
  Hunter, D. R. and Handcock, M. S. (2006)
  \emph{Inference in curved exponential family models for networks},
  Journal of Computational and Graphical Statistics.
  
  Hunter DR, Handcock MS, Butts CT, Goodreau SM, Morris M (2008b).
  \pkg{ergm}: A Package to Fit, Simulate and Diagnose
  Exponential-Family Models for Networks.
  \emph{Journal of Statistical Software}, 24(3).
  \url{http://www.jstatsoft.org/v24/i03/}.
  
  Krivitsky PN (2012). Exponential-Family Random Graph Models for Valued
  Networks. \emph{Electronic Journal of Statistics}, 2012, 6,
  1100-1128. \href{http://dx.doi.org/10.1214/12-EJS696}{\code{doi:10.1214/12-EJS696}}
  
  Morris M, Handcock MS, Hunter DR (2008).
  Specification of Exponential-Family Random Graph Models:
    Terms and Computational Aspects.
  \emph{Journal of Statistical Software}, 24(4).
  \url{http://www.jstatsoft.org/v24/i04/}.
  
}

\keyword{models}


