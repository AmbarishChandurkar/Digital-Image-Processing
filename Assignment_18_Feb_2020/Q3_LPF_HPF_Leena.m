%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 18 February 2020
% Q3) Apply the HPF & LPF on "Leena" Image
clc;clearvars;close all;

%% Part 1 : Import the Image

I_Leena = imread('Lenna_(test_image).png');
I_Leena = rgb2gray(I_Leena);
figure(1); title('Original Image'); imshow(I_Leena);

%% Part 2 : Design the Filters

HPF = [-1,-1,-1;-1,8,-1;-1,-1,-1];
%This is a simple Laplacian Mask (Ref : Sridhar, Chapter : Image Enhancement)

LPF = [1,1,1;1,1,1;1,1,1] .* (1/9);
%This is a averaging filter mask (Ref : Sridhar, Chapter : Image Enhancement)

%% Part 3 : Apply the Filters

I_Leena_HPF = conv2(I_Leena,HPF);
I_Leena_LPF = conv2(I_Leena,LPF);
figure(2);
subplot(121); imshow(uint8(I_Leena_HPF)); title("Leena - HPF (Observe the Edges)");
subplot(122); imshow(uint8(I_Leena_LPF)); title("Leena - LPF (Observe the Blur Effect)");