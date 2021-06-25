function [ totalDistance ] = Distance( valuesX, valuesY )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    totalDistance = sqrt(diff(valuesX)^2 + diff(valuesY)^2);
    
end

