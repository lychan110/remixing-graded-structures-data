% ==============================================================================
% Demo for generating shapes by mixing basis classes
%
% Author: Yu-Chin Chan (ychan@u.northwestern.edu), 03/18/21
%
% Please cite: Chan, Y.-C., et al., Struct Multidisc Optim, 65, 135 (2022).
%              DOI: 10.1007/s00158-022-03224-x
% ==============================================================================
clc, clearvars, close all;
addpath('blending');

%% load data
load('data_basis_classes/truss_2d_red5_hires.mat') % 5 truss bases
% load('data_basis_classes/dpp_2d_sp20_hires.mat') % 20 shape-property diverse bases

%% set up hyperparameters
dpp.fams = 1:5;               % indices of basis classes to blend (any combo, e.g., [1,3,5])
beta2    = 32;                % parameter for soft union in shape blending scheme
nsamp    = 5;                 % number of isovalue samples
coeff    = [0.5,0.1,0,0.4,0]; % pick or generate random coefficients; one for each basis
t        = -0.1;              % pick an isovalue for the new shape

%% generate a random shape via multiclass blending
[f,f0] = shapeBlending(dpp,coeff,t,beta2);
% plot
figure, imagesc(f0>=0); axis square tight ij off; colormap(flipud(gray));
title('Before imposing lower feasible bounds');
figure, imagesc(f>=0); axis square tight ij off; colormap(flipud(gray));
title('Final new shape via multiclass blending');

%% vary the volume of the new shape and plot
% linearly vary the isovalue parameter
tt = linspace(-0.5,0.5,nsamp);
% generate and plot new shapes for each isovalue sample
figure;
for ii = 1:nsamp
    ft = shapeBlending(dpp,coeff,tt(ii),beta2);
    subplot(1,5,ii), imagesc(ft>=0); axis equal tight ij off;
    title(sprintf('t = %.2f',tt(ii)),'fontsize',14);
end
colormap(flipud(gray));
