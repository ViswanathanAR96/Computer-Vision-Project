function App( )
%APP Summary of this function goes here
    T = table();
    fileWithNA = readtable('Supportingfile.xlsx');
    file = rmmissing(fileWithNA);
    caseID = file.id; 
    grade = file.V03KLGrade;
    csvFile = 'data.xlsx';
    disp(size(caseID,1));
    disp(caseID(168));
    for h = 1:1:size(caseID,1)       
        distanceVector1 = [];
        distanceVector2 = [];
        distanceVector3 = [];
        distanceVector4 = [];
        distanceVector5 = [];
        noOfPixelsVector = [];     
        for i = 27:1:138
            imgPath = strcat('\preds\', string(caseID(h)), '_', sprintf('%03d',i), '_pred.png');
             [distanceVector, noOfPixels ] = Main( imgPath );
             distanceVector1(end+1) = distanceVector(1);
             distanceVector2(end+1) = distanceVector(2);
             distanceVector3(end+1) = distanceVector(3);
             distanceVector4(end+1) = distanceVector(4);
             distanceVector5(end+1) = distanceVector(5);
             noOfPixelsVector(end+1) = noOfPixels;
        end            
        T(h,:) = {grade(h,1), distanceVector1, distanceVector2, distanceVector3, distanceVector4, distanceVector5, noOfPixelsVector};    
    end    
    T.Properties.VariableNames = {'grade', 'dist1', 'dist2', 'dist3', 'dist4', 'dist5', 'pixCount'};
    writetable(T, csvFile);
end

