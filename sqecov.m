function K = sqecov(x, z)
% The squared exponential covariance is computed
% by this function where the parameters passed are 
%
%   x could be any one of the matrices for training the inputs
%   z could be any one of the matrices for training the inputs
%   The initial values for the hyperparameters are taken as
%   sigma 'f'   - 0.25
%   'l'         - 0.25
%   sigma 'f'   - 0.25
ell = 0.25;   % For step 1 arbitarary values are passed for 'l'
sf2 = 0.0625; % For step 1 arbitarary values are passed for sigma 'f'               
% precompute squared distances
% 'msd' is nothing but the function that cmputes the mean square distance
K = msd(diag(1./ell)*x',diag(1./ell)*z');
K = sf2*exp(-K/2);                                                  % covariance
end