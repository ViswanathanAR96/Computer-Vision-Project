function [ image ] = ReadImage( pathFromDir )
%READIMAGE Summary of this function goes here
%  Read Image from the Directory
% Input: pathFromDir - Provide the image path from the present working directory
% Returns: image - Matlab readable image
    image = strcat(pwd, pathFromDir);
    image = imread(image); 
end

