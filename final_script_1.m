%   This script will perform both step 1 and step 2 of the project
%
%


%   Step 1 - Finding the regressed value for the input vector. Assuming the
%   hyperparameters to be of arbitrary values. The accuracy has been calculated 
%   as the root mean error of the output .
%   Arbitrary values assumed for the hyperparameters are
%   sigma 'f'   =   0.25
%   'l'   =   0.25
%   sigma 'n'   =   0.25
clear;
load('Gaussian_process_regression_data.mat');   % The given file is loaded
x = input_train;     
xstar = input_val;
y = target_train;
ystar = target_val;
kxx = sqecov(x,x);  % K(x,x) is computed.
kxxstar = sqecov(x,xstar);  % K(x,x*) is computed.
kxstarx = sqecov(xstar,x);  % K(x*,x) is computed.
kxstarxstar = sqecov(xstar,xstar);  % K(x*,x*) is computed.
id = create_id(kxx);    % Idenetity matrix as the same size of K(x,x) is created.
cn = noisecov(kxx,id);  % cn is the noise covariance
fstar = regression(kxxstar,cn,y);    
error = precision(fstar,target_val);
confidence = uncertainty(kxstarxstar,kxxstar,cn);

% STEP 1 OVER%
% The result of the step 1 process are stored in the corresponding
% variables.



% STEP 2 %
%   The hyperparameter that fit the trained model better is computed.
hyp = [0.25 0.25 0.25];
handle = @getfunc;
getglobal('Gaussian_process_regression_data.mat');  
newhyp = fminsearch(handle,hyp);
% A new set of covariance function are computd with the new estimated
% hyperparameter values and corresponding noise covriance factor is also
% computed.
%
% Since the target_val function is given we have applied the inpt_val 
% function for the computation so that we could verify our resulting output
% and estimate our error factor of our project.
fkxx = fsqecov(x,x,newhyp);
fkxxstar = fsqecov(x,xstar,newhyp);
fkxstarx = fsqecov(xstar,x,newhyp);
fkxstarxstar = fsqecov(xstar,xstar,newhyp);
fcn = fnoisecov(fkxx,newhyp);
optimised_regressed_target_val = regression(fkxxstar, fcn , y);
new_error = precision(optimised_regressed_target_val , target_val);
new_confidence = uncertainty(fkxstarxstar ,fkxxstar , fcn);
%
%
%TARGET VAL FOUND
% Now the input_test is passed as 'testxstar' and the corresponding
% covariance functions are computed and applied over the regressor to get
% regressed output values - 'target_test' which we do not have. So we were
% unable to check the error factor.

x = input_train;
testxstar = input_test;
testkxx = fsqecov(x,x,newhyp);
testkxxstar = fsqecov(x,testxstar,newhyp);
testkxstarx = fsqecov(testxstar,x,newhyp);
testkxstarxstar = fsqecov(testxstar,testxstar,newhyp);
testcn = fnoisecov(testkxx,newhyp);
optimised_regressed_target_test = regression(testkxxstar, testcn , y);
test_confidence = uncertainty(testkxstarxstar ,testkxxstar , testcn);


% Thank You %