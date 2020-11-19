function gaussArray = gaussPyramid(img)
    gaussArray = {img};

    for i = 2:6
        img = impyramid(img,'reduce');
        gaussArray{i} = img;  
    end

end