%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 10 January 2019
%In this is Script following operations are done on a sample Image
% 1) Display original Image
% 2) Treat each bit of the 8 bit grayscale image as separate image plane 
%    and plot each bit plane as separate 8 images.
% 3) Finally combine all the bit image planes EXCEPT the LSB Image plane,
%    and display the resultant image.
% 4) Observe the effect of compression i.e removal of the LSB plane on the
%   memory size and the quality of image w.r.t original. 
clc;clearvars;close all;

%% Part 1 : Display original Image
I = imread('Lenna_(test_image).png');
I = rgb2gray(I);
%H = size(I,1); %Height of Image
%W = size(I,2); %Width of Image
imshow(I);
title('Original Image');
%% Part 2 : Plotting of each Bit plane
%I_Bits = zeros(H,W,8); %Initialise 8 image planes for 8 bits

%% Trial1 : Bit planes as 1,0
% for Row = 1:1:H
%     for Col = 1:1:W
%         BitPattern  = dec2bin(I(Row,Col),8);
%         for idx = 1:1:8
%             Bit = str2double(BitPattern(idx));
%             I_Bits(Row,Col,idx) = cast(Bit,'uint8');
%         end
%     end
% end

% figure(2); %Show the 8 images for comparison
% for idx = 1:1:8
%     subplot(2,4,idx);
%     imshow(I_Bits(:,:,idx));
% end
%% Trial 2 : Bit planes magnitude by anding with 128 (10000000), 64(01000000),etc

figure(2);
for idx = 1:8
    subplot(2,4,idx);
    I_Bit_idx = bitand(I,uint8(2^(8-idx))); %Use andmask to ignore other bits and take only idx th bit
    imshow(I_Bit_idx);
    title(strcat('Bit Plane No.',num2str(9-idx)));
end
%% Part 3 : Making and Display of Compressed Image

I_Bit_removeLSB = bitand(I,uint8(254)); %The LSB is forcibly made 0 by anding with '11111110' (254)
figure(3);
imshow(I_Bit_removeLSB);
title('Image with LSB Removed');
%% Part 4 : Comparison of Original and Compressed Image

figure(4);

subplot(121);
imshow(I);
title('Original Image');

subplot(122);
imshow(I_Bit_removeLSB);
title('Original Image with LSB Removed');
