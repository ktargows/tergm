%  File man/simulate.stergm.Rd in package tergm, part of the Statnet suite
%  of packages for network analysis, http://statnet.org .
%
%  This software is distributed under the GPL-3 license.  It is free,
%  open source, and has the attribution requirements (GPL Section 7) at
%  http://statnet.org/attribution
%
%  Copyright 2003-2014 Statnet Commons
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\name{simulate.stergm}
\alias{simulate.stergm}
\alias{simulate.network}
\alias{simulate.networkDynamic}
\title{
Draw from the distribution of an Separable Temporal Exponential Family Random Graph Model
}
\description{
\code{\link[stats]{simulate}} is used to draw from separable temporal exponential family 
  random network models in their natural parameterizations.
  See \code{\link{stergm}} for more information on these models.
}
\usage{
\method{simulate}{stergm}(object, nsim=1, seed=NULL,
  coef.form = object$formation.fit$coef,
  coef.diss = object$dissolution.fit$coef,
  constraints = object$constraints,
  monitor = object$targets,
  time.slices=1, time.start=NULL, time.burnin=0, time.interval=1,
  control=control.simulate.stergm(),
  statsonly=NULL,
  output=c("networkDynamic", "stats", "changes", "final"),
  nw.start = NULL,
  stats.form = FALSE,
  stats.diss = FALSE,
  duration.dependent = NULL,
  verbose=FALSE, 
  \dots)
\method{simulate}{network}(object, nsim=1, seed=NULL,
  formation, dissolution,
  coef.form, coef.diss,
  constraints = ~.,
  monitor = NULL,
  time.slices=1, time.start=NULL, time.burnin=0, time.interval=1, time.offset=1,
  control=control.simulate.network(),
  statsonly=NULL,
  output=c("networkDynamic", "stats", "changes", "final"),
  stats.form = FALSE,
  stats.diss = FALSE,
  duration.dependent = NULL,
  verbose=FALSE,
  \dots)
\method{simulate}{networkDynamic}(object, nsim=1, seed=NULL,
   formation = attr(object, "formation"),
   dissolution = attr(object, "dissolution"),
   coef.form = attr(object, "coef.form"),
   coef.diss = attr(object, "coef.diss"),
   constraints = NVL(attr(object, "constraints"), ~.),
   monitor = attr(object, "monitor"),
   time.slices=1, time.start=NULL, time.burnin=0, time.interval=1, time.offset=1,
   control=control.simulate.network(),
   statsonly=NULL,
   output=c("networkDynamic", "stats", "changes"),
   stats.form = FALSE,
   stats.diss = FALSE,
   duration.dependent = NULL,
   verbose=FALSE,
   \dots)
}
\arguments{
  \item{object}{an \R object of type \code{\link{stergm}} giving a model
    fit or of type \code{\link{network}} giving the initial network.

    \code{simulate.network} understands the \code{\link{lasttoggle}}
    "API".
  }
  \item{formation, dissolution}{
    One-sided \code{\link{ergm}}-style formulas for the formation and
    dissolution models, respectively.
  }
  
  \item{nsim}{Number of replications (separate chains of networks) of
    the process to run and return. The \code{\link{networkDynamic}}
    method only supports \code{nsim=1}.
  }
  \item{seed}{Random number integer seed.  
    See \code{\link[base]{set.seed}}.
  }
  
  \item{coef.form}{Parameters for the model from which the 
    post-formation network is drawn.
  }
  \item{coef.diss}{As \code{coef.form}, but for the post-dissolution network.
  }

  \item{constraints}{A one-sided formula specifying one or more constraints
    on the support of the distribution of the networks being modeled,
    using syntax similar to the \code{formula} argument. Multiple constraints
    may be given, separated by \dQuote{+} operators.
    Together with the model terms in the formula and the reference measure, the constraints
    define the distribution of networks being modeled.

    It is also possible to specify a proposal function directly
    by passing a string with the function's name. In that case,
    arguments to the proposal should be specified through the
    \code{prop.args} argument to \code{\link{control.ergm}}.

    The default is \code{~.}, for an unconstrained model.

    See the \link[=ergm-constraints]{ERGM constraints} documentation for
    the constraints implemented in the \code{\link[=ergm-package]{ergm}}
    package. Other packages may add their own constraints.

    For STERGMs in particular, the constraints apply to the
    post-formation and the post-dissolution network, rather than the
    final network. This means, for example, that if the degree of all
    vertices is constrained to be less than or equal to three, and a vertex
    begins a time step with three edges, then, even if one of its edges
    is dissolved during its time step, it won't be able to form another
    edge until the next time step. This behavior may change in the future.
    
    Note that not all possible combinations of constraints are supported.
  }
  
  \item{monitor}{Either a one-sided formula specifying one or more terms whose
    value is to be monitored, or a string containing \code{"formation"} or
    \code{"dissolution"}, to monitor their respective terms, or
    \code{"all"} to monitor distinct terms from both.
  }
  \item{time.slices}{
    Number of time slices (or statistics) to return from each replication of the dynamic process. See below for
    return types. Defaults to 1, which, if \code{time.burnin==0} and
    \code{time.interval==1} (the defaults), advances the process one
    time step.
  }

  \item{time.start}{
    An optional argument specifying the time point at which the
    simulation is to start. See Details for further information.
  }
    
  \item{time.burnin}{
    Number of time steps to discard before starting to collect network
    statistics. Actual network will only be returned if \code{time.burnin==0}.
  }
  \item{time.interval}{
    Number of time steps between successive recordings of network
    statistics. Actual network will only be returned if \code{time.interval==1}.
  }

  \item{time.offset}{
    Argument specifying the offset between the point when the state of the network is sampled (\code{time.start}) and the the beginning of the spell that should be recorded for the newly simulated network state.
  }

  \item{control}{
    A list of control parameters for algorithm
    tuning. Constructed using \code{\link{control.simulate.stergm}} or \code{\link{control.simulate.network}}.
  }
  \item{statsonly}{Deprecated in favor of \code{output}.
  }
  \item{output}{A character vector specifying output type: one of
    "networkDynamic" (the default), "stats", and "changes", with partial
    matching allowed. See Value section for details.}

  \item{nw.start}{A specification for the starting network to be used by
    \code{simulate.stergm}, optional for EGMME fits, but required for
    CMLE and CMPLE fits:
    \describe{
      \item{a numeric index \code{i}:}{use \code{i}th time-point's
	network, where the first network in the series used to fit the
	model is defined to be at the first time point;}
      \item{strings \code{"first"} or \code{"last"}:}{the first or last
	time point used in fitting the model; or}
      \item{a \code{\link{network}} object:}{specify the network
	directly.}
    }
    \code{\link{networkDynamic}}s cannot be used as starting networks
    for \code{simulate.stergm} at this time. (They
    can be used as starting networks for \code{simulate.networkDynamic},
    of course.)
  }
  
  \item{stats.form, stats.diss}{Logical: Whether to return
    formation/dissolution model statistics. This is not the recommended
    method: use \code{monitor} argument instead.}
    
  \item{duration.dependent}{Logical: Whether the model terms in formula 
    or model are duration dependent. E.g., if a duration-dependent term 
    is used in estimation/simulation model, the probability of forming or 
    dissolving a tie may dependent on the age the dyad status. }
        
  \item{verbose}{Logical:  If TRUE, extra information is printed
    as the Markov chain progresses. 
  }
  \item{\dots}{Further arguments passed to or used by methods.
  }
}


\details{
  The dynamic process is run forward and the results are returned. For
  the method for \code{\link{networkDynamic}}, the simulation is resumed
  from the last generated time point of \code{object}, by default with
  the same model and parameters.

  The starting network for the \code{\link{stergm}} object method
  (\code{simulate.stergm}) is determined by the \code{nw.start}
  argument.

  The time index of the start of the simulation is determined as
  follows:
  \itemize{
    \item{If \code{time.start} is specified, it is used as the initial
      time index of the simulation.}
    \item{If \code{time.start} is not specified (is \code{NULL}), then
      if the \code{object} carries a time stamp from which to start
      or resume the simulation, either in the form
      of a \code{"time"} network attribute (for the
      \code{\link{network}} method --- see the
      \code{\link{lasttoggle}} "API") or
      in the form of an \code{\link{net.obs.period}} network attribute (for the
      \code{\link{networkDynamic}} method), this attribute will be used. (If
      specified, \code{time.start} will override it with a warning.)
    }
    \item{Othewise, the simulation starts at 0.}
  }
}
\value{
  Depends on the \code{output} argument:
  \item{"stats"}{If \code{stats.form==FALSE} and
    \code{stats.diss==FALSE}, an \code{\link{mcmc}} matrix with
    monitored statistics, and if either of them is \code{TRUE}, a
    list containing elements \code{stats} for statistics specified in the
    \code{monitor} argument, and \code{stats.form} and \code{stats.diss}
    for the respective formation and dissolution statistics.

    If \code{stats.form==FALSE} and
    \code{stats.diss==FALSE} and no monitored statistics are specified,
    an empty list is returned, with a warning.

    When \code{nsim>1}, an \code{\link{mcmc.list}} (or list of them) of
    the statistics is returned instead.}

  \item{"networkDynamic"}{A \code{\link[networkDynamic]{networkDynamic}}
    object representing the simulated process, with ties present in the
    initial network having onset \code{-Inf} and ties present at the end
    of the simulation having terminus \code{+Inf}. The method for
    \code{\link[networkDynamic]{networkDynamic}} returns the initial
    \code{\link[networkDynamic]{networkDynamic}} with simulated changes
    applied to it. The \code{\link{net.obs.period}} network attribute is
    updated (or added if not existing) to reflect the time period that was
    simulated. If the network does not have any \code{\link[networkDynamic]{persistent.ids}} 
    defined for vertices, a vertex.pid will be attached in a vertex attribute 
    named \code{'tergm_pid'} to facilitate 'bookkeeping' between the networkDynamic 
    argument and the simulated network time step.

    Additionally, attributes (\code{\link{attr}}, not network
    attributes) are attached as follows:
    \describe{
      \item{\code{formation}, \code{dissolution}, \code{monitor}:}{Formation, dissolution,
	and monitoring formulas	used in the simulation,	respectively.}
      \item{\code{stats}, \code{stats.form}, \code{stats.diss}:}{Network statistics as above.}
      \item{\code{coef.form}, \code{coef.diss}:}{Coefficients used in the simulation.}
      \item{\code{changes}:}{A four-column matrix summarizing the changes in the
	\code{"changes"} output. (This may be removed in the future.)}
    } 

    When \code{nsim>1}, a \code{\link{network.list}} of these
    \code{\link{networkDynamic}}s is returned.
  }
  
  \item{"changes"}{An integer matrix with four columns (\code{time},
      \code{tail}, \code{head}, and \code{to}), giving the time-stamped
      changes relative to the current network. \code{to} is \code{1} if
      a tie was formed and \code{0} if a tie was dissolved. The
      convention for \code{time} is that it gives the time point during
      which the change is effective. For example, a row
      \code{c(5,2,3,1)} indicates that between time \eqn{4} and \eqn{5},
      a tie from node \eqn{2} to node \eqn{3} was formed, so that it was
      absent at time point \eqn{4} and present at time point \eqn{5};
      while a row \code{c(5,2,3,0)} indicates that in that time, that
      tie was dissolved, so that it is was present at time point \eqn{4}
      and absent at time point \eqn{5}.

      Additionally, same attributes (\code{\link{attr}}, not network
      attributes) as with \code{output=="networkDynamic"} are attached.

      When \code{nsim>1}, a list of these change matrices is returned.}

    \item{"final"}{A \code{\link[network]{network}}
    object representing the last network in the series generated. This
    is not implemented in the method for
    \code{\link[networkDynamic]{networkDynamic}}.

    \code{\link{lasttoggle}} attributes are also included.

    Additionally, attributes (\code{\link{attr}}, not network
    attributes) are attached as follows:
    \describe{
      \item{formation, dissolution, monitor:}{Formation, dissolution,
	and monitoring formulas	used in the simulation,	respectively.}
      \item{stats, stats.form, stats.diss:}{Network statistics as above.}
      \item{coef.form, coef.diss:}{Coefficients used in the simulation.}
      \item{changes}{A four-column matrix summarizing the changes in the
	\code{"changes"} output. (This may be removed in the future.)}
    }

    When \code{nsim>1}, a \code{\link{network.list}} of these
    \code{\link{network}}s is returned.
  }

}

\examples{
logit<-function(p)log(p/(1-p))
coef.form.f<-function(coef.diss,density) -log(((1+exp(coef.diss))/(density/(1-density)))-1)

# Construct a network with 20 nodes and 20 edges
n<-20
target.stats<-edges<-20
g0<-network.initialize(n,dir=TRUE)
g1<-san(g0~edges,target.stats=target.stats,verbose=TRUE)

S<-10

# To get an average duration of 10...
duration<-10
coef.diss<-logit(1-1/duration)

# To get an average of 20 edges...
dyads<-network.dyadcount(g1)
density<-edges/dyads
coef.form<-coef.form.f(coef.diss,density)

# ... coefficients.
print(coef.form)
print(coef.diss)

# Simulate a networkDynamic
dynsim<-simulate(g1,formation=~edges,dissolution=~edges,
                 coef.form=coef.form,coef.diss=coef.diss,
                 time.slices=S,verbose=TRUE)

# "Resume" the simulation.
dynsim2<-simulate(dynsim,time.slices=S,verbose=TRUE)
}