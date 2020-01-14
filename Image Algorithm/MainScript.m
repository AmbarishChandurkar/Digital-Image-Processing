%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 13 January 2019 - Theory Class
%In this is Script following operations are done on a sample Image
% 1) Display original Image
% 2) Pad Image with zeros on all sides
% 3) i) For a given pixel in the padded image, move in the anticlockwise
%       direction in neighboring 8 pixels.
%    ii) For a pair of pixels, if the center pixel is lesser than
%       neighbouring pixel, then record '1' for that pixel, else record '0'
%    iii) After recording bits for all 8 places, consider first bit as LSB
%       and then take equivalent decimal value and replace it in place of
%       center pixel.
% 4) Compare original and resultnt image 
clc;clearvars;close all;

%% Part 1 : Display original Image
I = imread('Lenna_(test_image).png');
I = rgb2gray(I);
imshow(I);
title('Original Image');

%% Part 2 : Pad Image with zeros on all sides
H = size(I,1); %Height of Image
W = size(I,2); %Width of Image

I_PadZero = [zeros(H,1),I,zeros(H,1)];
I_PadZero = [zeros(1,W+2);I_PadZero;zeros(1,W+2)];

%% Part 3 : Implementation of Algorithm

I_New = zeros(H,W);
for Row = 1:H
    for Col = 1:W
        CurrRow = Row+1; %Save the current Row and Col Values
        CurrCol = Col+1;
        
        CurrPixel = I_PadZero(CurrRow,CurrCol);
                
        NewPixel = 1*(CurrPixel<I_PadZero(CurrRow,CurrCol+1))+...
            2*(CurrPixel<I_PadZero(CurrRow-1,CurrCol+1))+...
            4*(CurrPixel<I_PadZero(CurrRow-1,CurrCol))+...
            8*(CurrPixel<I_PadZero(CurrRow-1,CurrCol-1))+...
            16*(CurrPixel<I_PadZero(CurrRow,CurrCol-1))+...
            32*(CurrPixel<I_PadZero(CurrRow+1,CurrCol-1))+...
            64*(CurrPixel<I_PadZero(CurrRow+1,CurrCol))+...
            128*(CurrPixel<I_PadZero(CurrRow+1,CurrCol+1)); %Calculation of New Value of Pixel
        
        I_New(Row,Col) = NewPixel;
    end
end
I_New = uint8(I_New); %Convert to Unsigned 8-Bit Data Type
%% Part 4 : Comparison of Original and Resultant Image

figure(2);
subplot(121);
imshow(I);
title('Original Image');

subplot(122);
imshow(I_New);
title('Image After Applying Algorithm');