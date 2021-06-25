function [ caseID, imgID ] = SplitURL( imgPath )
%SPLITURL Summary of this function goes here
%   Detailed explanation goes here
    fileNamePos = find(imgPath == '\', 1, 'last');
    fileName = imgPath(fileNamePos+1:end);
    strings = regexp(fileName,'_', 'split');
    caseID = char(strings(1));
    imgID = char(strings(2));
end

