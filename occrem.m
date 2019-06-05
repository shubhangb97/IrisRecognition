%processing on unnormalized images 
function mask=occrem(img)
%img=imread('018_3.bmp');
inv_img=255-img;
%SE = strel('disk',1);
w=ones([26 26]);% w is the structuring element
thresh=im2bw(inv_img,0.9);
img1=imerode(thresh,w);
 img2=img1;
[m n]= find(img1(8:size(img2,1),size(img2,2)/2:size(img2,2)));
%imtool(img);
%imtool(img1);
for i=1:size(m)
     img2(m(i)+3:size(img1,1),n(i)+(size(img1,2)/2)-1)=ones(size(img1,1)-m(i)-3+1,1);
end
%imtool(img2);
img2(:,1:(size(img1,2))/2)=zeros(size(img1,1),size(img1,2)/2);
img2=1-img2;
mask=img2;
%imtool(img2);
end