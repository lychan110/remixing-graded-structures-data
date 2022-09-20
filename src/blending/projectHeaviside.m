%%% APPLY HEAVISIDE PROJECTION %%%
function filtered = projectHeaviside(x, HeavBeta, HeavEta, HeavDenom, sensitivity)
if isempty(HeavDenom)
    HeavDenom = tanh(HeavBeta*HeavEta) + tanh(HeavBeta*(1-HeavEta));
end
if sensitivity
    filtered = HeavBeta *( 1-tanh(HeavBeta*(x-HeavEta)).^2 ) ./ HeavDenom;
else
    filtered = ( tanh(HeavBeta*HeavEta) + tanh(HeavBeta*(x-HeavEta)) ) ./ HeavDenom;
end
end % end of file
