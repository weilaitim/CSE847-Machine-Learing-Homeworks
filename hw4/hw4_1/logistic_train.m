function [weights] = logistic_train(data, labels, epsilon, maxiter)
%
% code to train a logistic regression classifier
%
% INPUTS:
% data = n * (d+1) matrix withn samples and d features, where
% column d+1 is all ones (corresponding to the intercept term)
% labels = n * 1 vector of class labels (taking values 0 or 1)
% epsilon = optional argument specifying the convergence
% criterion - if the change in the absolute difference in
% predictions, from one iteration to the next, averaged across
% input features, is less than epsilon, then halt
% (if unspecified, use a default value of 1e-5)
% maxiter = optional argument that specifies the maximum number of
% iterations to execute (useful when debugging in case your
% code is not converging correctly!)
% (if unspecified can be set to 1000)
%
% OUTPUT:
% weights = (d+1) * 1 vector of weights where the weights correspond to
% the columns of "data"
%

N=length(labels);
n = size(data,2);
%modify (1,0) labels to (1,-1) labels
labels = 2*labels -ones(N,1);
%initialize weights to be a zero vector
weights = zeros(n,1);

if nargin == 3
    %if not specified set maximum iteration number to be 1000
    maxiter=1000;
end
%initialgize number of iterations
itr = 0;
%intialize change of log-likelihood objective function
step = 1;
while itr <= maxiter && step>1e-6
    %calculate -gradient
    grad = 1/N * data' * ((epsilon*labels)./(1 + exp(labels.* (data * weights))));
    %update weights
    weights = weights+grad;
    %calculate approximation of change of log-likelihood objective function
    step = norm(grad)^2;
    %update number of iterations
    itr = itr+1;
end

    
end