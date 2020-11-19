clear;
newImage = imread('lenna.png');
%figure;imshow(newImage);
gaussArr = gaussPyramid(newImage);
laplaceArr = laplPyramid(gaussArr);
%for i=1:6
%    figure;imshow(laplaceArr{i});
%end
%expanded = impyramid(gaussArr{2},'expand');
%figure;imshow(gaussArr{1});
%figure;imshow(expanded);
reconstruction = collapse(laplaceArr);

img1 = imread('hand5.jpg');
img1 = imresize(img1,[1024 1024]);
img1 = im2double(img1);
img2 = imread('eyes1500.jpg');
img2 = imresize(img2,[1024 1024]);
img2 = im2double(img2);
%img1 = rgb2gray(img1);
%img2 = rgb2gray(img2);
%figure;imshow(img2);
%figure;imshow(img1);
gaussArr1 = gaussPyramid(img1);
laplaceArr1 = laplPyramid(gaussArr1);
gaussArr2 = gaussPyramid(img2);
laplaceArr2 = laplPyramid(gaussArr2);

figure; h_im = imshow(img1);    
circ = drawcircle('Center',[455,485],'Radius',145);
BW = createMask(circ);
figure;imshow(BW);title("mask");
[r,c,d]=size(BW);
if d ~= 3
    BW = cat(3, BW, BW, BW);
end
A = zeros(size(img2), class(img2));
A(BW) = img2(BW);


A(~BW) = img1(~BW);
figure;imshow(A);title("asdfsadsfa");
%figure;imshow(img1);
%figure;imshow(img2);

gaussArr3 = gaussPyramid(A);

k = 5;
S = {gaussArr3{6}};

for i = 2:6
    for z = 1 : 3
    for m = 1 : size(laplaceArr1{i},1)
        for n = 1 : size(laplaceArr1{i},2)  
            S{i}(m,n,z) = gaussArr3{k}(m,n,z)*laplaceArr1{i}(m,n,z)+(1- gaussArr3{k}(m,n,z))*laplaceArr2{i}(m,n,z);     
        end
    end
    end
    %figure;imshow(S{i});
    k = k - 1;
end

T = collapse(S);
figure;imshow(T);title("last");
