function cn = noisecov( kxx , id )
% This function cmputes and returns the noise covariance factor 'cn'
% For step 1 arbitarary values are passed for 'l'
sn = 0.25;
sn = sn^2;
int = sn.*id;
cn = kxx+int;
end