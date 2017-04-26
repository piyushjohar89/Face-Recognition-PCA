%Algorithm of Principal component analysis
function [ out_PCA,V] = PCA_algo( A,x,mA)  

size_of_matrix=size(A,1);  
Y=(A-repmat(mA,size_of_matrix,1));
%Sample matrix centralized
H=Y*Y';  
% largest x eigen value and eigen vector of H  
[Z,G]=eigs(H,x);
V=Y'*Z;          
%normalisation
for i=1:x     
    %normalise
    l=norm(V(:,i));  
    %normalise
    V(:,i)=V(:,i)/l;  
    %end of loop
end  

out_PCA=Y*V ;...       
end