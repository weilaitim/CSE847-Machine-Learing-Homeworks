function I = SRKM(R,K)
%spectral relaxation of k-means
[V,D] = eig(R*R');
A=V(:, end-K+1: end);
%apply the ordinary K-means to data vectors in reduced dimension space
[C,I] = KNN(A,K);
end

