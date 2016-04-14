function K = fsqecov(x,z,hyp)
% The squared exponential covariance is computed
% by this function where the parameters passed are 
% 
%   x could be any one of the matrices for training the inputs
%   z could be any one of the matrices for training the inputs
%   hyp is a matrix of three elements holding the values of the
%   hyperparameters [ sigma 'f', 'l', sigma 'n']
sf = hyp(1,1);
ell = hyp(1,2);
sn = hyp(1,3);
sf2 = sf.^2;
% precompute squared distances
% 'msd' is nothing but the function that cmputes the mean square distance
K = msd(diag(1./ell)*x',diag(1./ell)*z'); 
K = sf2*exp(-K/2);
end