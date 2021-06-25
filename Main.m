function [distanceVector, noOfPixels ] = Main( imgPath )
%MAIN Summary of this function goes here
    %   Getting the image
%      imgPath = '\preds\9872052_081_pred.png';
    image = ReadImage(imgPath);
    [ row, cols ] = size( image);
    %   Finding the centroid of Femer and Tibia bones
    [ stat ] = Centroids( image );  
    [rowCentroid, colCentroid] = size(stat);   
    if (rowCentroid <2)
        [distanceVector, noOfPixels ] = setNan();
    else
        xCentroid1 = stat(1).Centroid(1);
        yCentroid1 = stat(1).Centroid(2);
        xCentroid2 = stat(2).Centroid(1);
        yCentroid2 = stat(2).Centroid(2);
        %Calculating the number of pixels that are bones between the 2 centroid
        %regions
        [noOfPixels] = PixelsOfBones(xCentroid1,  xCentroid2, cols, image);
        %   Displaying only the edge of Femer and Tibia
        cannyEdges = double(edge(image, 'canny', [], 1));
        %   Displaying the points that have intensity = 1 along the vertical line
        %   of Centroid of FemeryCentroid1
        [ avgDistanceCentroidToFemerEnd, avgDistanceCentroidToTibiaStart ] = AvgDistanceFromCentroids( cannyEdges, stat );
        %   Intersection points of femer and the line
        if (isnan(avgDistanceCentroidToFemerEnd))
             [distanceVector, noOfPixels ] = setNan();
        else          
            femerLinePoIColumn = find(cannyEdges(round(yCentroid1),:));
            %   Intersection points of Tibia and the line
            tibiaLinePoIColumn = find(cannyEdges(round(yCentroid2),:));
            %   Marking the intersection points with a square
            plot(femerLinePoIColumn,round(yCentroid1), 's');
            hold on;
            plot(tibiaLinePoIColumn,round(yCentroid2), 's');
            hold on;
            %   Finding the slope and intercept from the 2 centroid points
            [ slope, yIntercept ] = RegLine( xCentroid1, yCentroid1, xCentroid2, yCentroid2 );
            [ xIncrementRange ] = YvalueForUnitX( slope, yIntercept );
            %   Plotting the line between two centroid Pointa
            x = xCentroid1:xIncrementRange:xCentroid2;
            y = slope*x + yIntercept;
            %   Finding the points across the x-axis whereever the femer edges meets
            %   the Centroid Horizondal Line
            POIFemerCentroidLine = find(cannyEdges(round(yCentroid1), :));
            %   Finding the points across the x-axis whereever the tibia edges meets
            %   the Centroid Horizondal Line
            POITibiaCentroidLine = find(cannyEdges(round(yCentroid2), :));
            if((size(POITibiaCentroidLine,2) > 1) && (size(POIFemerCentroidLine,2) > 1))
            %   Finding the range to iterate between the Femer Centroid Horizonal Line 
            %   Point 2 and Tibia Centroid Horizondal Line 
                xPointsRange2 = POIFemerCentroidLine(2);
                xPointsRange1 = POITibiaCentroidLine(2);
                %   Iterating through the Range
                %total distance and number of data points considered
                [ distanceVector, length ] = DistanceVector( x, y, cannyEdges, POIFemerCentroidLine, POITibiaCentroidLine, xCentroid1 );            
            else
            [distanceVector, noOfPixels ] = setNan();
            end
        end
    end
   
end

