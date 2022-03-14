
clc;
clear all;
warning off;
addpath(genpath(pwd));

load D_initial
load image_whole

% normal scene definded
X_g = image_whole(:,3364:end,:);
X_g_2d = reshape(X_g./max(X_g(:)).*255,[],size(X_g,3));
% Spectral dictionary and Sparse Coefficient Optimization
[D_0] = Optimization_OSD(X_g_2d',D_initial);

% given image to be detected
X = image_whole(357:end,1045:3364,:);
X = X./max(X(:)).*255;
X_2d = reshape(X,[],size(X_g,3));
% Sparse Coefficient Optimization
[anomaly_map] = Optimization_coefficient(X_2d',D_0,X);

figure;imshow(double(X(1873:2193,1084:1364,[3 2 1]))./max(double(X(:))))
figure;imshow(anomaly_map(1873:2193,1084:1364)./max(max(anomaly_map(1873:2193,1084:1364))))   