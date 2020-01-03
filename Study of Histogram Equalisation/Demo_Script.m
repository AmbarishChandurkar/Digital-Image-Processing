%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 3 January 2019
%This is "Demo Script" to show the working of the custom MATLAB Function "MyHistEq"
clc;clearvars;close all;
%% Part 1 : Demo on the 8 X 8 Matrix as on Wikipedia
WikiImage = imread('WikiImage.png');
figure(1);
imshow(WikiImage); %Show the original Image

WikiImage_HistEq = MyHistEq('WikiImage.png');
figure(2);
imshow(WikiImage_HistEq); %Show the Histogram Equalised Image

%% Part 2 : Demo on the Leena Image

TestImage = imread('Lenna_(test_image).png');
TestImage = rgb2gray(TestImage);
figure(3);
imshow(TestImage); %Show the original Image

TestImage_HistEq = MyHistEq('Lenna_(test_image).png');
figure(4);
imshow(TestImage_HistEq); %Show the Histogram Equalised Image