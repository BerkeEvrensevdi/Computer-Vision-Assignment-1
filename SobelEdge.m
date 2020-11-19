function value = SobelEdge(img)

x1 = [1;2;1];
x2 = [-1,0,1];  
y1 = [-1;0;1];
y2 = [1,2,1];
img = rgb2gray(img);
image1Q = zeros(size(img));
for i=1:size(img,1)
    for j=1:size(img,2)-2
        a = img(i,j);
        b = img(i,j+1);
        c = img(i,j+2);
        k = a*x2(1,1)+b*x2(1,2)+c*x2(1,3);
        image1Q(i,j+1) = k;       
    end
end
image1T = zeros(size(image1Q));
for i=1:size(image1Q,2)
    for j=1:size(image1Q,1)-2
        a = image1Q(j,i);
        b = image1Q(j+1,i);
        c = image1Q(j+2,i);
        k = a*x1(1,1)+b*x1(2,1)+c*x1(3,1);
        image1T(j+1,i) = k;
    end
end
%figure;imshow(image1T*-1,[]);
image2Q = zeros(size(img));
for i=1:size(img,1)
    for j=1:size(img,2)-2
        a = img(i,j);
        b = img(i,j+1);
        c = img(i,j+2);
        k = a*y2(1,1)+b*y2(1,2)+c*y2(1,3);
        image2Q(i,j+1) = k;
    end
end
image2T = zeros(size(image2Q));
for i=1:size(image2Q,2)
    for j=1:size(image2Q,1)-2
        a = image2Q(j,i);
        b = image2Q(j+1,i);
        c = image2Q(j+2,i);
        k = a*y1(1,1)+b*y1(2,1)+c*y1(3,1);
        image2T(j+1,i) = k;
    end
end
%figure;imshow(image2T,[]);
value = {image1T*-1,image2T};


