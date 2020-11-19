function laplArray = laplPyramid(gaussianPyramid)
    toExpand = gaussianPyramid{6}; 
    laplArray = {toExpand}; % L5 = G5 , laplArray{1} = G5, laplArray{2} L4 = G4 - expand(G5)
    i = 2;
    for k=6:-1:2
        toExpand = impyramid(gaussianPyramid{k},'expand'); % expand(G5)
        rows = size(gaussianPyramid{k-1},1);
        columns = size(gaussianPyramid{k-1},2);
        toExpand = imresize(toExpand,[rows columns]);
        laplArray{i} = imsubtract(gaussianPyramid{k-1},toExpand); % L4 = G4 - expand(G5)
        i = i + 1;
    end

    
end