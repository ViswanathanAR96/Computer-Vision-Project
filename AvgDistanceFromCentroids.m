function [ avgDistanceCentroidToFemerEnd, avgDistanceCentroidToTibiaStart ] = AvgDistanceFromCentroids( cannyEdges, stat )
%AVGDSITANCEFROMCENTROIDS Summary of this function goes here
%   Detailed explanation goes here
    yCentroid1 = stat(1).Centroid(2);
    yCentroid2 = stat(2).Centroid(2);
    center = uint8(stat(1).Centroid);
    edgeIndices = find(cannyEdges(:,center(1)));
    if (size(edgeIndices, 1) > 2)
        %Finding the average distance between the Centroid and Femer
        avgDistanceCentroidToFemerEnd = round((yCentroid1 + edgeIndices(2))/2);
        %Finding the average distance between the Centroid and Tibia
        avgDistanceCentroidToTibiaStart = round((yCentroid2 + edgeIndices(3))/2);  
    else
        avgDistanceCentroidToFemerEnd = NaN;
        avgDistanceCentroidToTibiaStart = NaN;
    end
end

