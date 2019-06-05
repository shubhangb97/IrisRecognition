function eigenPCA=getPCA(P,k)%numtr,num_of_p
%k=500;%num of eigenvectors
%[P Ptest]=data_import(numtr,num_of_p);%numtr=3
data_size=size(P);
P_av=sum(P,2)/data_size(2);
P_av=repmat(P_av,[1 data_size(2)]);
P=P-P_av;
X=transpose(P)*P;
[E D]=eig(X);% E is eigenvectors D is eigenvalues
%if ~issorted(diag(D))
    %[V,D] = eig(A);
%    [D1,I] = sort(diag(D),'descend');
%    E = E(:, I);
%end

E=fliplr(E);
V=P*E;
unit=sqrt(sum( (V.*V) , 1 ));
V=V ./ repmat(unit,[size(V,1) 1]);
%Vk=V(:,1:k);
Vk=V(:,1:k);
eigenPCA=Vk;
%alpha=transpose(Vk)*P; % the eigencoefficients of each iris image in training in the form first column hascoeff of first 
end