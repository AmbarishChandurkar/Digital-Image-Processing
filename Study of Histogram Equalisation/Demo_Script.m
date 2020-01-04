%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 3 January 2019
%This is "Demo Script" to show the working of the custom MATLAB Function "MyHistEq"
clc;clearvars;close all;
%% Part 1 : Demo on the 8 X 8 Matrix as on Wikipedia
WikiImage = imread('WikiImage.png');
figure(1);
subplot(121);
imshow(WikiImage); %Show the original Image
title('Original Image');

subplot(122);
WikiImage_HistEq = MyHistEq('WikiImage.png');
imshow(WikiImage_HistEq); %Show the Histogram Equalised Image
title('Histogram Equalised Image');

%% Part 2 : Demo on the Leena Image

TestImage = imread('Lenna_(test_image).png');
TestImage = rgb2gray(TestImage);
figure(2);
subplot(121);
imshow(TestImage); %Show the original Image
title('Original Image of Leena');

subplot(122);
TestImage_HistEq = MyHistEq('Lenna_(test_image).png');
imshow(TestImage_HistEq); %Show the Histogram Equalised Image
title('Histogram Equalised Image of Leena');