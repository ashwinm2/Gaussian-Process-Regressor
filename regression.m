function fstar = regression( kxxstar , cn, y)
%   This function uses the regression which has been trained to 
%   predict the estimated output values for a given input test and
%   return the predicted values.
%   The input parameters are
%    kxxstar - K(x,xstar) - square covariance of x and xstar 
%    where x = input_train and xstar = input_val (or) input_test
%    cn - noise covariance function
%    y = target_train

cninv = inv(cn);
trans = kxxstar';
inter = trans*cninv;
fstar = inter*y;
end