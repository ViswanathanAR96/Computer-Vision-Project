function [ distanceVector, length ] = DistanceVector( x, y, cannyEdges, POIFemerCentroidLine, POITibiaCentroidLine, xCentroid1 )
%DISTANCEVECTOR Summary of this function goes here
%   Detailed explanation goes here
    distanceVector = [];
    length = 0; 
    datapoints = [POIFemerCentroidLine(1,1), (POIFemerCentroidLine(1,1)+ POIFemerCentroidLine(1,2))/3, xCentroid1, 2*(POIFemerCentroidLine(1,1)+ POIFemerCentroidLine(1,2))/3, POIFemerCentroidLine(1,2)];
    for i = 1:size(datapoints,2)
        if  (datapoints(i) < xCentroid1)
            tempX = xCentroid1 - datapoints(i) -10;
        elseif (datapoints(i) < xCentroid1)
             tempX = datapoints(i) - xCentroid1 - 10;
        else 
            tempX = xCentroid1 - datapoints(i);
        end
        [valuesX, valuesY] = PointsOfIntersectionWithEdges( abs(x-tempX), y, cannyEdges);
        
        if (isnan(valuesX))
            distanceVector(end+1) = nan;
            continue;
        end
        totalDistance = Distance(valuesX, valuesY);
        length = length + 1;
        distanceVector(end+1) = totalDistance;
    end
end

