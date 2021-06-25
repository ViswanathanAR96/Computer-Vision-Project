    function [ xIncrementRange ] = YvalueForUnitX( slope, yIntercept )
%YVALUEFORUNITX Summary of this function goes here
%   Detailed explanation goes here
    x1 = (1 - yIntercept) / slope;
    x2 = (2 - yIntercept) / slope;
    xIncrementRange  = abs(x2 - x1);

end

