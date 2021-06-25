function [ edgeImage ] = Edge( image )
%EDGE : Edge Detector: Display oly the edges of the image
%   Input: image - Matlab readable image
%   Returns: edge - edge image of the original image
    edgeImage = double(edge(image, 'canny', [], 1));

end

