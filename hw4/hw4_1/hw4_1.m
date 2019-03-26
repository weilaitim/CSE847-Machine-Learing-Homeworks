clear;
clc;
DATA= importdata('data.txt');
LABELS = importdata('labels.txt');
%n strores different size of training set
n=[200,500,800,1000,1500,2000];
epsilon = 1;
%initialize accuracy to be 0 for all experiments
acc=zeros(length(n),1);
%select train data set
data_test = DATA(2001:end,:);
label_test = LABELS(2001:end,:);
for i=1:length(n)
    %select training data from the pool
    data = DATA(1:n(i),:);
    labels = LABELS(1:n(i)); 
    %train classifier
    weights=logistic_train(data, labels, epsilon);    
    pred = data_test*weights>0;    
    acc(i)= nnz((pred == label_test ))/length(label_test);
end
plot(n,acc,'-o')
xlabel('training data set size n') 
ylabel('accuracy on the test data')
title('Logistic Regression: Experiment')
