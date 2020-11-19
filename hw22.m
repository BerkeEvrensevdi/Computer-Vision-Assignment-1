clear;
img1 = imread('dog.jpg');
img2 = imread('cat.jpg');
%img2 = imread('low_frequencies.jpg');
%figure;imshow(img1);
gaussfilter = fspecial('gaussian',[20 20],40);
gaussianBlur = imfilter(img1,gaussfilter);
gaussianBlur2 = imfilter(img2,gaussfilter);

figure;imshow(gaussianBlur);title('lowpass with hsize = [20 20] and sigma = 40');


img2 = im2double(img2);
gaussianBlur2 = im2double(gaussianBlur2);
gaussianBlur = im2double(gaussianBlur);
highPass = img2 - gaussianBlur2;
figure;imshow(highPass + 0.5);title('highpass with hsize = [20 20] and sigma = 40');
img3 = gaussianBlur + highPass;
figure;imshow(img3);title('Hybrid hsize = [20 20] and sigma = 40');
