function E=ldaClass(numtr,X,num_of_classes,kl)%X is the bank of coeficients
%num_of_classes=224;
%numtr=3;
%num_of_eigen=500;
%means=zeros(num_of_eigen,num_of_classes);%classwise


%X=getPCA(num_of_eigen,numtr,num_of_classes);%500 highest eigenvectors needed

num_of_eigen=size(X,1);
X1=reshape(X,[num_of_eigen, numtr, num_of_classes]);%has 3D format as given
means=sum(X1,2)/numtr;% mean of every class in 3D
meanrepe=repmat(means,[1 numtr 1]);
X2=X1-meanrepe;
variances=zeros(size(X2,1),size(X2,1),num_of_classes);
for i=1:num_of_classes
    variances(:,:,i)=X2(:,:,i)*X2(:,:,i)';
end
%variances contains class wise variance
Sw=sum(variances,3);
TotalMean=sum(X,2)/(num_of_classes * numtr);

%TotalMeanRep=repmat(TotalMean,[1 1 num_of_classes]);
Sb=zeros(num_of_eigen,num_of_eigen);
for i=1:num_of_classes
    Sb=Sb+ numtr*((means(:,:,i)-TotalMean)*transpose(means(:,:,i)-TotalMean));
end
Sw_inverse=pinv(Sw);
Eigen1=Sw_inverse*Sb;
[E, D]=eig(Eigen1);

%normalisation code
if ~issorted(fliplr(diag(D)))
    %[V,D] = eig(A);
    [D1,I] = sort(diag(D),'descend');
    E = E(:, I);
end

%E=fliplr(E);
V=E;
%V=X*E;% to get coefficients for the 
unit=sqrt(sum( (V.*V) , 1 ));
V=V ./ repmat(unit,[size(V,1) 1]);
Vkl=V(:,1:kl);
E=Vkl;
%alpha=transpose(Vk)*P;
end