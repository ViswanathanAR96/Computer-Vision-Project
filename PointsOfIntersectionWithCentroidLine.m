function [ valuesX, valuesY ] = PointsOfIntersectionWithCentroidLine( slope, yIntercept, xIncrementRange, xCentroid1, xCentroid2, cannyEdges )
%POINTSOFINTERSECTIONWITHCENTROIDLINE Summary of this function goes here
%   Detailed explanation goes here
    valuesX = [];
    valuesY = [];
    count = 0;
    temp = [];
    for x = xCentroid1:xIncrementRange*10:xCentroid2
        y = slope*x +yIntercept; 
        value = impixel(cannyEdges,round(x),round(y));
        if value == 1
            count = count + 1;
            valuesX(count) = x;
            valuesY(count) = y;                      
        end
    end   
    if (count>0)
        for i = 2:count
            if (round(valuesX(i)) == round(valuesX(i-1)))           
                temp(end+1) = i;
            end
        end
    end
    count = count - size(temp, 2);
    valuesX(temp) = [];
    valuesY(temp) = [];
end

