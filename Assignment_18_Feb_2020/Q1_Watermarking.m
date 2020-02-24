%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 18 February 2020
% Q1) Perform Image Watermarking using :
%       a) Bit Plane Slicing
%       b) DWT2
clc;clearvars;
%% Part a.1 : Bit Plane Slicing of Leena and Watermark Images

% First Display the Original Leena and Watermark Image
I_Leena = imread('Lenna_(test_image).png');
I_Leena = rgb2gray(I_Leena);
I_Watermark = imread('WatermarkIMG.png');
I_Watermark = rgb2gray(I_Watermark);
figure(1); title('Original Images');
subplot(212); imshow(I_Leena); subplot(212); imshow(I_Watermark);

% Next, Perform Bit plane Slicing of Both and Display their bit Planes

figure(2);
for idx = 1:8
    subplot(2,4,idx);
    I_Bit_idx = bitand(I_Leena,2^(8-idx)); %Use andmask to ignore other bits and take only idx th bit
    DivFactor = power(2,8-idx); %For 1 and 0
    I_Bit_idx = double(I_Bit_idx/DivFactor);
    imshow(I_Bit_idx);
    title(strcat('Bit Plane No.',num2str(9-idx)));
end

figure(3);
for idx = 1:8
    subplot(2,4,idx);
    I_Bit_idx = bitand(I_Watermark,2^(8-idx)); %Use andmask to ignore other bits and take only idx th bit
    DivFactor = power(2,8-idx); %For 1 and 0
    I_Bit_idx = double(I_Bit_idx/DivFactor);
    imshow(I_Bit_idx);
    title(strcat('Bit Plane No.',num2str(9-idx)));
end

%% Part a.2 : Combine both images

% Here, we observe that only first 5 bit planes are providing enough info
% So we create a new combined image, by joining first 5 MSB of Leena and
% first 3 MSB of Watermark, with the latter forming the LSB part of the new
% image

I_Leena_5MSB = bitand(I_Leena,248); %Get the first 5 MSB
I_Watermark_3MSB = bitsrl(I_Watermark, 5); %Get the first 3 MSB
I_Final = bitor(I_Leena_5MSB,I_Watermark_3MSB); %Combine
figure(4);
imshow(I_Final);
title("Watermarked Image");
%% Part a.4 : Recover back the watermark

I_RecoverWatermark = bitsll(I_Final,5);
figure(5);
imshow(I_RecoverWatermark);
title("Recovered Watermark");
%% Part b.1 : Watermarking using DWT2

[Leena_LL,Leena_LH,Leena_HL,Leena_HH] = dwt2(I_Leena,'haar'); %Decompose the Leena Image
[Watermark_LL,Watermark_LH,Watermark_HL,Watermark_HH] = dwt2(I_Watermark,'haar'); %Decompose the Watermark Image

Combined_LL = (0.95*Leena_LL) + (0.05*Watermark_LL);

I_Combined = idwt2(Combined_LL,Leena_LH,Leena_HL,Leena_HH,'haar');

figure(6);
imshow(uint8(I_Combined));
title("Watermarking using DWT2");
%% Part b.2 : Recover back the watermark from dwt

[Combine_LL,Combine_LH,Combine_HL,Combine_HH] = dwt2(I_Combined,'haar'); %Decompose the Combined Image
I_RecWatrLL = (Combine_LL - (Leena_LL*0.95))/0.05;
I_RecWatr = idwt2(I_RecWatrLL,Leena_LH,Leena_HL,Leena_HH,'haar');

figure(7);
imshow(uint8(I_RecWatr));
title('Recovered Watermark using IDWT2');