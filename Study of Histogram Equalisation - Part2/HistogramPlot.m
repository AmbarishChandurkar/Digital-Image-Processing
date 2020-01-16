%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 3 January 2019
%This script plots the histograms of the original and the equalised leena
%image.
clc;clearvars;close all;

%% Import Images Data and plot them

load('Data.mat')
figure(1);
subplot(121);
imshow(TestImage); %Show the original Image
title('Original Image of Leena');

subplot(122);
imshow(TestImage_HistEq); %Show the Histogram Equalised Image
title('Histogram Equalised Image of Leena');

%% Plot and compare the histograms

figure(2)

subplot(121)
histogram(reshape(TestImage,[1 numel(TestImage)]));

subplot(122)
histogram(reshape(TestImage_HistEq,[1 numel(TestImage_HistEq)]));

figure(3)

subplot(121)
histogram(reshape(WikiImage,[1 numel(WikiImage)]));

subplot(122)
histogram(reshape(WikiImage_HistEq,[1 numel(WikiImage_HistEq)]));

