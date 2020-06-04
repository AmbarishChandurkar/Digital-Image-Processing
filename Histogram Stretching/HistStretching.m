%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 7 Feb 2020
% This MATLAB function encapsulates the algorithm of "Histogram Stretching"
% Ref : S.Sridhar, DIP, 2e
clc;clearvars;
ImageName = 'Lenna_(test_image).png';
%% Read the image and also get the dimensions
I = imread(ImageName);
[Row,Col,Depth] = size(I);

%% Convert the image to grayscale and then to 1-D Array
if(Depth > 1)
    I = rgb2gray(I);
end
I_Original = reshape(I,[1,Row*Col]);
%% Image Histogram - Count all the unique values in the Image Matrix
I_Original_UniqVal = unique(I_Original); %Get the unique values
rmin = double(I_Original_UniqVal(1));%Lowest value of Input Histogram, which is non - zero
rmax = double(I_Original_UniqVal(end));
%% Assuming an image of L - grey levels
L = 256; %Since the Image is grey
Smax = L-1; % These are the upper and lower limits of the Stretching
Smin = 0;
%% Calculated Stretched Histogram
S = zeros(numel(1:1:numel(I_Original_UniqVal)),1);
for idx = 1:1:numel(I_Original_UniqVal)
    S(idx) = ceil(((Smax - Smin)/(rmax - rmin)) * (double(I_Original_UniqVal(idx)) - rmin) + Smin);
end
LUT = [I_Original_UniqVal';S]; %Lookup Table for mapping
%% Resultant Image
I_New = zeros(Row,Col);
for idx = 1:1:numel(S)
    I_New(I_Original == I_Original_UniqVal(idx)) = S(idx);
end
I_New = reshape(I_New,[Row,Col]);
I_New = cast(I_New,'uint8'); %Typecasting is needed, since matrix is "double"

figure(1);
subplot(211);
imshow(I);
subplot(212);
imhist(I_Original);
title("Before Histogram Stretching");

figure(2);
subplot(211);
imshow(I_New);
subplot(212);
imhist(I_New);
title("After Histogram Stretching");