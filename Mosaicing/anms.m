% File name: anms.m
% Author: Kashish Gupta and Rajat Bhageria
% Date created: 11/7/17

function [y, x, rmax] = anms(cimg, max_pts)
% Input:
% cimg = corner strength map
% max_pts = number of corners desired

% Output:
% [x, y] = coordinates of corners
% rmax = suppression radius used to get max_pts corners

[n,m] = size(cimg);
[C,R] = meshgrid(1:m,1:n); %calling these vectors row, column, rather than the usual X,Y
feature_locations = [R(cimg~=0),C(cimg~=0)];
max_value = max(max(cimg))*0.9;

num_features = size(feature_locations, 1);
radii = zeros(num_features, 1); 

for i = 1:num_features
    this_location = feature_locations(i,:);
    this_value = cimg(this_location(1), this_location(2));
    if this_value >= max_value
        radii(i) = 1000000; %set this equal to the max value
    else
        threshold = this_value / 0.9;
        threshold_locations = [R(cimg>=threshold), C(cimg>=threshold)];
        [~,d] = dsearchn(threshold_locations, this_location); 
        radii(i) = d(1);
    end
end

sorted_radii = sort(radii, 'descend');
rmax = sorted_radii(max_pts);

% if size(feature_locations((radii>=rmax),:), 1) > max_pts
%     radii_greater = sort(radii(radii>rmax));
%     rmax = radii_greater(1);
% end

y_x = feature_locations((radii>=rmax),:);
y_x = y_x(1:max_pts,:);
y = y_x(:,1);
x = y_x(:,2);

end