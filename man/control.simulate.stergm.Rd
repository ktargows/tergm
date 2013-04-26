%  File man/control.simulate.stergm.Rd in package tergm, part of the Statnet suite
%  of packages for network analysis, http://statnet.org .
%
%  This software is distributed under the GPL-3 license.  It is free,
%  open source, and has the attribution requirements (GPL Section 7) at
%  http://statnet.org/attribution
%
%  Copyright 2003-2013 Statnet Commons
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\name{control.simulate.stergm}
\alias{control.simulate.stergm}
\alias{control.simulate.network}
\title{ Auxiliary for Controlling Separable Temporal ERGM Simulation }
\description{
  Auxiliary function as user interface for fine-tuning STERGM simulation.
}
\usage{
control.simulate.stergm(MCMC.burnin=NULL, MCMC.burnin.mul=NULL,
                        MCMC.prop.weights.form=NULL,MCMC.prop.args.form=NULL,
                        MCMC.prop.weights.diss=NULL,MCMC.prop.args.diss=NULL,
                        MCMC.init.maxedges=NULL,
                        MCMC.packagenames=NULL,
                        MCMC.init.maxchanges=NULL)

control.simulate.network(MCMC.burnin=1000, MCMC.burnin.mul=7,
                        MCMC.prop.weights.form="default",MCMC.prop.args.form=NULL,
                        MCMC.prop.weights.diss="default",MCMC.prop.args.diss=NULL,
                        MCMC.init.maxedges=20000,
                        MCMC.packagenames=c(),
                        MCMC.init.maxchanges=1000000)

}
\details{
    This function is only used within a call to the \code{\link{simulate}} function.
    See the \code{usage} section in \code{\link{simulate.stergm}} for details.
}
\arguments{
  \item{MCMC.burnin}{Maximum number of Metropolis-Hastings steps per phase
    (formation and dissolution) per time step.
  }
  \item{MCMC.burnin.mul}{Multiplier for the number of "changeables" to
    determine the Metropolis-Hastings steps per phase (formation and
    dissolution) per time steps. (I.e., for formation, the number of
    steps will be set to
    \code{(network.dyadcount(nw0)-network.edgecount(nw0))*control$MCMC.burnin.mul},
    while for dissolution, it will be set to
    \code{network.edgecount(nw0)*control$MCMC.burnin.mul}, or
    \code{control$MCMC.burnin}, whichever is smaller.)
  }

  \item{MCMC.prop.weights.form, MCMC.prop.weights.diss}{Specifies the proposal distribution used in the MCMC
    Metropolis-Hastings algorithm for formation and dissolution, respectively. Possible choices are \code{"TNT"} or 
    \code{"random"}; the \code{"default"}.  
    The \code{TNT} (tie / no tie) option puts roughly equal weight on selecting a
    dyad with or without a tie as a candidate for toggling, whereas the
    \code{random} option puts equal weight on all possible dyads, though the
    interpretation of \code{random} may change according to the constraints in
    place.  When no constraints are in place, the default is TNT, which 
    appears to improve Markov chain mixing particularly for networks with a
    low edge density, as is typical of many realistic social networks.
  }
  \item{MCMC.prop.args.form, MCMC.prop.args.diss}{An alternative, direct way of specifying additional arguments to proposals. 
  }
  \item{MCMC.init.maxchanges}{Maximum number 
    of toggles changes for which to allocate space.
  }
  \item{MCMC.packagenames}{Names of packages in which to look for change statistic
    functions in addition to those autodetected. This argument should not be
    needed outside of very strange setups.
  }
  \item{MCMC.init.maxedges}{Maximum number of edges expected in network.
  }
}
\value{
  A list with arguments as components.
}
\seealso{ \code{\link{simulate.stergm}}, \code{\link{simulate.formula}}. 
\code{\link{control.stergm}} performs a 
similar function for
\code{\link{stergm}}.   }
%\keyword{simulation}
\keyword{models}