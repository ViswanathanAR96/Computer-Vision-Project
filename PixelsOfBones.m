function [noOfPixels] = PixelsOfBones(xCentroid1, xCentroid2, cols, image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    noOfPixels = 0;
    filter1 = ones(ceil(xCentroid2-xCentroid1), cols);
    filter2 = ones(floor(xCentroid2-xCentroid1), cols);
    imgSegment = image(xCentroid1:xCentroid2,1:end)./255;
    
    if(size(imgSegment) == size(filter1))
        noOfPixels = sum(sum(mtimes(double(filter1), double(imgSegment)')));
    else
        noOfPixels = sum(sum(mtimes(double(filter2), double(imgSegment)')));
    end
end

