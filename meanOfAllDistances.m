function [ meanOfAllDistances ] = meanOfAllDistances(distanceVector, length )
%DISTANCEVECTOR Summary of this function goes here
%   Detailed explanation goes here
    sumOfAllDistances = 0;
    for i = 1:size(distanceVector,2)
        if (isnan(distanceVector(i)))
            continue
        else
            sumOfAllDistances = sumOfAllDistances + distanceVector(i);
        end
    end
    meanOfAllDistances = sumOfAllDistances/length;
end

