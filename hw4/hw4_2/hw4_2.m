clc;
clear;
%Initialize the list of parameters
par  = [0, 0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
data = load('ad_data');
%Initialize auc and number of nonzero parameters
auc = zeros(1,length(par));
NONZEROw = zeros(1,length(par));
% load('feature_name')
for i=1:length(par)
    %train sparse logistic regression model to get parameters in w
    [w, c] = logistic_l1_train(data.X_train, data.y_train, par(i));
    %calculate the estimated probabilities of the logistic regression model
    y_pred =(1./(1 + exp(-1*data.X_test*w)));
    %calculate AUC with perfcurve funciton
    [X,Y,T,AUC] = perfcurve(data.y_test,y_pred,1);
    %find number of nonzero entries
    NONZEROw(i) = nnz(w~=0);
    auc(i)=AUC;
end
figure
plot(par, auc,'-o')
xlabel('regularization parameter') 
ylabel('AUC')
figure
plot(par, NONZEROw,'-o')
xlabel('regularization parameter') 
ylabel('number of features selected')

