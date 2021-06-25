function [ valuesX, valuesY ] = PointsOfIntersectionWithEdges( x,y, cannyEdges )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    count = 0;
    temp = [];
    valuesX = [];
    valuesY = [];
    for i = 1:size(x,2)
        if(impixel(cannyEdges, floor(x(i)),floor(y(i))) == 1)           
            count = count + 1;
            valuesX(count) = x(i);
            valuesY(count) = y(i);  
        end      
    end
    if (count>0)
        for i = 2:count
            if (floor(valuesX(i)) == floor(valuesX(i-1)))           
                temp(end+1) = i;
            elseif (valuesX(i) - valuesX(i-1) < 1)
                temp(end+1) = i;
            end
        end
    end
    count = count - size(temp, 2);
    valuesX(temp) = [];
    valuesY(temp) = [];
    if (count < 2)
        valuesX = nan;
        valuesX = nan;
    elseif (count > 2)
       valuesX = valuesX(1:2);
       valuesY = valuesY(1:2);
    end
end

