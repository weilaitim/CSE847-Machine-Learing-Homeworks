%% Generate random dataset
clc
clear
K = 3;
m1 = [1 1 0 0 0];
m2 = [0 0 4 0 0];
m3 = [0 0 0 5 5];
R = [ones(10,1)*m1; ones(10,1)*m2; ones(10,1)*m3];
R= R+randn(size(R));
%% Ordinary K-means
[C,I] = KNN(R,K);
%% Spectral relaxation K-means
I2 = SRKM(R,K);
%% Compare clustering
c=[I;I2];