clear;
img = imread('lenna.png');
img = im2double(img);
sobel = SobelEdge(img);
figure;imshow(sobel{1},[]);
figure;imshow(sobel{2},[]);
%figure;imshowpair(sobel{1},sobel{2},'montage');title('Gx and Gy');
gradientMagnitude = (sobel{2}.^2 + sobel{1}.^2).^1/2;
figure;imshow(gradientMagnitude);title('Gradient Magnitude');
