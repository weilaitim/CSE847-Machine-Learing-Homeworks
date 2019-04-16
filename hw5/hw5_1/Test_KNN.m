%% Create a 2-d random dataset
K = 3;
mu1 = [2 3];
mu2 = [8 10];
mu3 = [10 0];
sigma1 = [2 1.5; 1.5 2];
sigma2 = [2 -1.5; -1.5 2];
sigma3 = [1 0; 0 1];
% rng('default')  % For reproducibility
n=[100 100 100];
R1 = mvnrnd(mu1,sigma1,n(1));
R2 = mvnrnd(mu2,sigma2,n(2));
R3 = mvnrnd(mu3,sigma3,n(3));
R= [R1;R2;R3];
%% k-means wiht alternating procedure
[C,I] = KNN(R,K);
clf
for i = 1:K
    plot(R(I==i,1),R(I==i,2),'+')
    hold on
end
plot(C(:,1),C(:,2),'k.','markersize',20)
