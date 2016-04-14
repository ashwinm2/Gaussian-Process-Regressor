function K = getfunc(hyp)
%   Log marginal likelihood function is computed
%
%
global xg
global yg
sf = hyp(1,1);
ell = hyp(1,2);
sn = hyp(1,3);
x= xg;
y = yg;
z=x;
sf2 = sf.^2;
% precompute squared distances
K = msd(diag(1./ell)*x',diag(1./ell)*z');
K = sf2*exp(-K/2);
% K(x,x) is computed to find the new noise covariance factor
[m,n] = size(K);
ide = eye(m,n);
sn2 = sn.^2;
inter = ide.*sn2;
cn2 = K + inter;
% which is then substituted in the log marginal likelihood function
% the third part of the equation is constant given by - 
% n / 2 log(2*3.14)
% need not be considered since all it does is to normalise th value of the
% function.
cninv = inv(cn2);
ytrans = y';
K = ytrans*cninv*y;
first = (-K/2);    
inter2= prod(diag(chol(cn2)))^2; % Cholesky method to find determinant
if inter2
    inter3 = log(inter2);
    second = (-inter3/2);
    K = first + second;
end
K = first;

end