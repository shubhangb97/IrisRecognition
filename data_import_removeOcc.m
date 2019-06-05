function [trainX testX]=data_import_removeOcc(numtr,num_of_p)%numtr is the number from 5 to be included in each training set
%num_of_p=224;
%num_training=5;
%num_testing=5;
imSize=[48 432];%imtool(reshape(eigenPCA*eigVecsFinal * ldaCoeffs(:,5)+meanX,[48 432]),[-50 100])
%X=zeros(imSize(1)*imSize(2),num_of_p);
trainX=zeros(imSize(1)*imSize(2)/2,(num_of_p*numtr));
testX=zeros(imSize(1)*imSize(2)/2,num_of_p*(5-numtr));
irisFolder=uigetdir();
pathimg=dir(irisFolder);
jtr=1;
jte=1;
%for i=3:num_of_p
    for j=3:size(pathimg)%3 as . and .. are not to be done
        path=strcat([irisFolder '\' pathimg(j).name]);
        if(mod((j-3),5)<numtr)
        
            occluded=imread(path);
            occluded=occluded(:,1:imSize(2)/2);
            trainX(:,jtr)=reshape(occluded,[imSize(1)*imSize(2)/2 1]);
            jtr=jtr+1;
        if(jtr>size(trainX,2))
            break;
        end;
        else
            occluded=imread(path);
            occluded=occluded(:,1:imSize(2)/2);
        testX(:,jte)=reshape(occluded,[imSize(1)*imSize(2)/2 1]);
        jte=jte+1;
        if(jte>size(testX))
            break;
        end
        %X(:,j)=reshape(imread(path),[imSize(1)*imSize(2) 1]);
    end
%end
end