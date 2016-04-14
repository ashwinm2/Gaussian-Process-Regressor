function error = precision(a,b)
% The function computes the root mean square distance between the two
% matrices to compute the error factor.
error = sqrt(mean((a(:)-b(:)).^2));
end