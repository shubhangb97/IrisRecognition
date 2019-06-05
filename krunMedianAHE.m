te=zeros(12,1);
kpa=[5 10  20 40 50 80 100 150 200 300 400 450];
kla=[3 5   15 20 25 30 50  70 120 180 220 220];
%kp=200;
%kl=100;
numtr=3;
num_of_classes=224;
num_of_p=224;
[P Ptest]=data_import_full(numtr,num_of_p);
%[P Ptest]=data_import_removeOcc(numtr,num_of_p);
meanX=sum(P,2)/(num_of_p*numtr);


for i2=1:12
kp=kpa(i2)
kl=kla(i2);

eigenPCA=getPCA(P,kp);%kp highest eigenvectors calculated
alpha=transpose(eigenPCA)*(P-repmat(meanX,[1 size(P,2)]));%coefficients of data
eigVecsFinal=ldaClass(numtr,alpha,num_of_classes,kl);
ldaCoeffs=transpose(eigVecsFinal)*alpha;%lda eigencoefficients of data

%testSize=size(test)
%for i=1:testSize(2)
    
%end;
%prClass=ldaGetPredict(eigVecsFinal,eigenPCA,ldaCoeffs,test(:,7),meanX)
%[prClass dist]=predict(ldaCoeffs,eigVecsFinal,eigenPCA,train(:,6)-meanX,numtr);
%[o d e]=predict_all(ldaCoeffs,eigVecsFinal,eigenPCA,P-repmat(meanX,[1 size(P,2)]),numtr);
%[o d e]=predict_all(ldaCoeffs,eigVecsFinal,eigenPCA,P-repmat(meanX,[1 size(P,2)])+100*rand([size(P,1) size(P,2)]),numtr);
[o d e]=predict_all(ldaCoeffs,eigVecsFinal,eigenPCA,Ptest-repmat(meanX,[1 size(Ptest,2)]),numtr);
te(i2)=(1.0-sum(e)/size(Ptest,2));
end;
figure;
plot(kpa,te);
title('Recognition Rate vs. k of PCA');
xlabel('k');
ylabel('Recognition Rate');
axis on;