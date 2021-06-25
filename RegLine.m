    function [ slope, yIntercept ] = RegLine( xCentroid1, yCentroid1, xCentroid2, yCentroid2 )
%REGLINE Summary of this function goes here
   %Finding the slope and intercept from the 2 centroid points
    slope = (yCentroid2 - yCentroid1)/(xCentroid2 - xCentroid1);
    yIntercept = yCentroid2 - slope*xCentroid2;

end

