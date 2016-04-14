function getglobal(myfile)
%   The 'Gaussian_process_regression_data.mat' is loaded and the global
%   values are assigned.
%

global xg
global yg
global xt
we = load(myfile);

 xg = we.input_train;
 yg = we.target_train;
 xt = we.input_test;

end