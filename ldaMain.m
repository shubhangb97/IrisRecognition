kp=200;
kl=100;
numtr=3;
num_of_classes=200;
num_of_p=200;
[P Ptest]=data_import(numtr,num_of_p);
meanX=sum(P,2)/(num_of_p*numtr);
eigenPCA=getPCA(P,kp);%kp highest eigenvectors calculated
alpha=transpose(eigenPCA)*(P-repmat(meanX,[1 size(P,2)]));%coefficients of data
eigVecsFinal=ldaClass(numtr,alpha,num_of_classes,kl);
ldaCoeffs=transpose(eigVecsFinal)*alpha;%lda eigencoefficients of data

%testSize=size(test)
%for i=1:testSize(2)
    
%end;
%prClass=ldaGetPredict(eigVecsFinal,eigenPCA,ldaCoeffs,test(:,7),meanX)
%tic;
%[prClass dist]=predict(ldaCoeffs,eigVecsFinal,eigenPCA,train(:,6)-meanX,numtr);
%toc;
[o d e]=predict_all(ldaCoeffs,eigVecsFinal,eigenPCA,P-repmat(meanX,[1 size(P,2)]),numtr);
%[o d e]=predict_all(ldaCoeffs,eigVecsFinal,eigenPCA,P-repmat(meanX,[1 size(P,2)])+100*rand([20736 size(P,2)]),numtr);
%[o d e]=predict_all(ldaCoeffs,eigVecsFinal,eigenPCA,Ptest-repmat(meanX,[1 size(Ptest,2)]),numtr);