function [ stat ] = Centroids( image )
%CENTROIDS Summary of this function goes here
%   Input - image:  Matlab readable image
%   Return - stat: Object which contains the co-ordinates of the
%   centroids 
    Ibw = im2bw(image);
    Ibw = imfill(Ibw,'holes');
    Ilabel = bwlabel(Ibw);
    stat = regionprops(Ilabel,'centroid');


end

