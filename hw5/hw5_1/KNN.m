function [C,I] = KNN(R,K)%R is data matrix
    C=rand(K,size(R,2))*diag(max(R)-min(R))+ones(K,1)*min(R);    
    fl=1; %Intialize update measure
    while fl>1e-6
        % Compute distance to each centroid
        D=[];        
        for i=1:K
            D=[D;vecnorm((R-ones(length(R),1)*C(i,:))')];    
        end
        %find membership
        [M,I] = min(D);
        OC=C;
        %update new centroid
        for i=1:K
            if ismember(i,I)
                C(i,:)=mean(R(I==i,:));
            end
        end
        %compute centroid update measure
        fl=norm(C-OC,'fro');
    end
    plot(C(:,1),C(:,2),'o')
end