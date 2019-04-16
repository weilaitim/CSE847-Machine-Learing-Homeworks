clc
clear
load USPS.mat
P=[10 50 100 200];
%mean centering
mA=mean(A);
A=A-ones(length(A),1)*mA;

[V,D] = eig(A'*A);
B = cell(length(P),1);

%computed reconstruction errors
r_error= zeros([1,length(P)]);
for i= 1: length(P)
    B(i)={V(:, end-P(i)+1:end)};
    r_error(i) = norm(A-A*B{i}*B{i}','fro')^2;
end

%Slect the first 2 images and 3 other randomly slected images to reconstruct.
sl=[1,2,randi([3 3000],1,3)];

%Image reconstruction
clf
for j=1:length(sl)   
    for i = 1:length(P)
        RA2 =reshape(A(sl(j),:)*B{i}*B{i}'+mA, 16, 16) ; %Reconstructed Image
        subplot(length(sl),length(P)+1,(j-1)*(length(P)+1)+i ), imshow(RA2')
    end
    A2 = reshape(A(sl(j),:)+mA, 16, 16); %Original Image
    subplot(length(sl),length(P)+1,j*(length(P)+1) ), imshow(A2') 
end
