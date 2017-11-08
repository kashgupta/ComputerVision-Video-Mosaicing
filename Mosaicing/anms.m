% File name: anms.m
% Author:
% Date created:

function [y, x, rmax] = anms(cimg, max_pts)
% Input:
% cimg = corner strength map
% max_pts = number of corners desired

% Output:
% [x, y] = coordinates of corners
% rmax = suppression radius used to get max_pts corners

% Write Your Own Code Here
strengths = cimg(cimg>0);
featureLocations = 

numInitialFeatures = size(strengths, 2);

rAll = zeros(numInitialFeatures, 1); 
yAll = zeros(numInitialFeatures,1); 
xAll = zeros(numInitialFeatures,1);

counter = 1; 

for i = 1:numInitialFeatures
    value = strengths(i); 
    location = featureLocations(value); 
    
    [~,d] = dsearchn(featureLocations, location); 
    
    x( = featureLocations(i,2); 
    y(counter,1)  = featureLocations(i,1); 
    rmax
    rmax(counter)
    counter = counter + 1; 
end 

end