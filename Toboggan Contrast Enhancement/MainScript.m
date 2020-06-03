%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 7 February 2019
%This script to show the implementation of "Toboggan Contrast Enhancement"
clc;clearvars;close all;

%% Part 1 : Initialisation

GradMat = [12,14,23,13;
            16,11,21,18;
            21,24,23,12;
            12,21,20,10];
        
ImageMat = [4,4,3,2;
            3,7,6,1;
            2,7,6,2;
            0,1,0,2];

%% Part 2 : Pad Image  and Gradient Matrix with zeros on all sides
H = size(GradMat,1); %Height of Image
W = size(GradMat,2); %Width of Image

GradMat = [-1*ones(H,1),GradMat,-1*ones(H,1)];
GradMat = [-1*ones(1,W+2);GradMat;-1*ones(1,W+2)];

H2 = size(ImageMat,1); %Height of Image
W2 = size(ImageMat,2); %Width of Image

ImageMat = [-1*ones(H2,1),ImageMat,-1*ones(H2,1)];
ImageMat = [-1*ones(1,W2+2);ImageMat;-1*ones(1,W2+2)];

%% Part 3 : Implementation of Algorithm
N = [];
I_New = zeros(H,W);

for Row = 1:H
    for Col = 1:W
        CurrRow = Row+1; %Save the current Row and Col Values
        CurrCol = Col+1;
        
        N = [GradMat(CurrRow-1,CurrCol-1),
            GradMat(CurrRow-1,CurrCol),
            GradMat(CurrRow-1,CurrCol+1),
            GradMat(CurrRow,CurrCol-1),
            GradMat(CurrRow,CurrCol),
            GradMat(CurrRow,CurrCol+1),
            GradMat(CurrRow+1,CurrCol-1),
            GradMat(CurrRow+1,CurrCol),
            GradMat(CurrRow+1,CurrCol+1)];
        
        Index_x = [CurrRow-1,CurrRow-1,CurrRow-1,CurrRow,CurrRow,CurrRow,CurrRow+1,CurrRow+1,CurrRow+1];
        Index_y = [CurrCol-1,CurrCol,CurrCol+1,CurrCol-1,CurrCol,CurrCol+1,CurrCol-1,CurrCol,CurrCol+1];
        
        NonNegN_idx = find(N ~= -1);
        NonNegN = N(NonNegN_idx);
        MinN = min(NonNegN);
        idx = find(N == MinN);
        
        I_New(Row,Col) = ImageMat(Index_x(idx),Index_y(idx));
    end
end

