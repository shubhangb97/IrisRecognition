function [output, dist]=predict(bank,V,V_k,x,numtr)
alpha=(((V_k)')*(x));
alphaL=((V')*(alpha));
[Idx, D]=knnsearch(bank',alphaL','K',1,'Distance','euclidean');
%Idx=dsearchn(bank',alphaL');
 output=floor((Idx-1)/numtr)+1;
 dist=D;
end
