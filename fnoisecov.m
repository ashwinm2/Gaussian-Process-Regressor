function cn = fnoisecov( kxx , hyp )
% This is the final function which computes and returns the noise 
% covariance factor 'cn' with the new hyperparameters estimated.
% The input parameters passed are
%   K(x,x) matrix
%   hyp is a matrix of three elements holding the values of the
%   hyperparameters [ sigma 'f', 'l', sigma 'n']
%
sn = hyp(1,3);
sn2 = sn^2;
id = eye(size(kxx));
int = sn2.*id;
cn = kxx+int;
end