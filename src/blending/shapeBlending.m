% ==============================================================================
% Multiclass shape blending via naive weighted sum + softmax union with feas mins
% This script corresponds to Fig. 1 and Eq. 2 in the paper below.
% 
% Author: Yu-Chin Chan (ychan@u.northwestern.edu), 03/15/21, 03/22/21, 10/06/2021
% 
% Please cite: Chan, Y.-C., et al., Struct Multidisc Optim, 65, 135 (2022).
%              DOI: 10.1007/s00158-022-03224-x
% ==============================================================================
function [f,fWSum] = shapeBlending(dpp,coeff,t,beta2)
dpp.nFams = length(dpp.fams);

%% step 1: naive weighted sum of basis classes
fWSum = -1e-9; % avoid singularity
for dd = 1:dpp.nFams
    fWSum = fWSum + coeff(dd) * ( dpp.SDF{dpp.fams(dd)}+dpp.tStar(dpp.fams(dd)) );
end
fWSum = fWSum + t; % inner isoval version
fInner0 = exp( beta2*fWSum );

%% step 2: softmax union with lowest feasible unit cell of each basis class
eta2 = prctile(coeff,75)-5e-2;
actv = projectHeaviside(coeff,128,eta2,[],0);
f = enforce_lower_feas_bound(actv,fInner0,dpp,beta2);
end % end of file

function [f,fInner] = enforce_lower_feas_bound(actv,fInner,dpp,beta2)
for dd = 1:dpp.nFams
    flow = (dpp.SDF{dpp.fams(dd)}+dpp.trf(dpp.fams(dd),1));
    fInner = fInner + actv(dd) * exp( beta2*flow );
end
f = log(fInner) / beta2;
end
