/*  File src/MHproposals_DynMLE_block.h in package tergm, part of the Statnet suite
 *  of packages for network analysis, http://statnet.org .
 *
 *  This software is distributed under the GPL-3 license.  It is free,
 *  open source, and has the attribution requirements (GPL Section 7) at
 *  http://statnet.org/attribution
 *
 *  Copyright 2003-2013 Statnet Commons
 */
#ifndef MHproposals_DynMLE_H
#define MHproposals_DynMLE_H

#include "edgetree.h"
#include "changestat.h"
#include "model.h"
#include "MHproposal.h"

void MH_FormationMLEblockdiag(MHproposal *MHp, Network *nwp);
void MH_DissolutionMLEblockdiag(MHproposal *MHp, Network *nwp);

void MH_FormationMLEblockdiagTNT(MHproposal *MHp, Network *nwp);

#endif 

