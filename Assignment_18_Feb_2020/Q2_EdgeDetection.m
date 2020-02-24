%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 18 February 2020
% Q2) Find the edges of "Leena" Image using:
%       a) DWT2
%       b) Canny
%       c) Sobel
clc;clearvars;close all;

%% Part 1 : Import the Image

I_Leena = imread('Lenna_(test_image).png');
I_Leena = rgb2gray(I_Leena);
figure(1); title('Original Image'); imshow(I_Leena);

%% Part a : Edges using DWT2

[Leena_LL,Leena_LH,Leena_HL,Leena_HH] = dwt2(I_Leena,'haar'); %Decompose the Leena Image

figure(2);
subplot(221); imshow(uint8(Leena_LL)); title("Leena_LL");
subplot(222); imshow(uint8(Leena_LH)); title("Leena_LH - Edges");
subplot(223); imshow(uint8(Leena_HL)); title("Leena_HL - Edges");
subplot(224); imshow(uint8(Leena_HH)); title("Leena_HH - Edges");

%% Part b : Edges using Canny

Edge_Canny = edge(I_Leena,'canny');
figure(3);
imshow(Edge_Canny); title("Edges using Canny");

%% Part c : Edges using Sobel

Edge_Sobel = edge(I_Leena,'sobel');
figure(4);
imshow(Edge_Sobel); title("Edges using Sobel");