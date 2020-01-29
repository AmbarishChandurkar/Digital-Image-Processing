%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 29 January 2019
%In this is Script following operations are done on a sample Image
% 1) Display original Image
% 2) Display the RGB Planes Separately
clc;clearvars;close all;

%% Part 1 : Display original Image
[I,cmap] = imread('Lenna_(test_image).png');
imshow(I);
title('Original Image');

%% Part 2 : Display RGB Planes Separately

figure(2);
subplot(131);
IRed = I;
IRed(:,:,2:3) = 0; %Take only Red Channel
imshow(IRed); 
title('R Plane')

subplot(132);
IGreen = I;
IGreen(:,:,1) = 0;
IGreen(:,:,3) = 0;
imshow(IGreen); %G-Color Plane
title('G Plane')

subplot(133);
IBlue = I;
IBlue(:,:,1:2) = 0;
imshow(IBlue); %B-Color Plane
title('B Plane')
