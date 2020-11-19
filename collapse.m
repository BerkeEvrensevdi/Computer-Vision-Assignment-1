function rec_img = collapse(laplacianPyramid)
rec_img = laplacianPyramid{1};

for i = 2 : 6
    rows = size(laplacianPyramid{i},1);
    columns = size(laplacianPyramid{i},2);
    rec_img = impyramid(rec_img,'expand');
    rec_img = imresize(rec_img,[rows columns]);
    rec_img = laplacianPyramid{i} + rec_img ;
    %figure;imshow(rec_img);
end