function[output dist error]=predict_all(bank,V,V_k,testd,numtr)
V_tot=(V_k)*(V);
alphaL=((V_tot)')*testd; %would do V'xi=yi together for all values of the dataset
[m n] = size(testd);
Ix=zeros(n,1);
D=zeros(n,1);
error=zeros(n,1);
%for displaying error we provide an error grid and the total error.
%A value in the error grid would be 0 for a correct prediction and 1 for a
%wrong prediction
bank_tr=bank';
alphaL_tr=alphaL';
for i=1:n
    [Ix(i) D(i)]=knnsearch(bank_tr,alphaL_tr(i,:));
    if(D(i)>4800)
        Ix(i)=-1; %this would mean that the dataset is not there
        error(i)=1;
    end
    if(((floor((i-1)/(5-numtr))+1)~=(floor((Ix(i)-1)/(numtr))+1))&&Ix(i)~=-1)
        error(i)=1;
    end
end

output=floor((Ix-1)/numtr+1);
dist=D;

end



    


