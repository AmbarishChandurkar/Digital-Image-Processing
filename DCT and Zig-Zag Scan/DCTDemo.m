%% Author : Ambarish Prashant Chandurkar (BT17ECE021)

% This is a demo script to show the results of MyDCT Function

%% Part 1 : Import the Image
I = imread('Lenna_(test_image).png');
I = rgb2gray(I);
ImageSize = size(I,1);
figure(1);
imshow(I);
title('Original Image');
I = double(I);
%% Part 2 : Get the DCT Kernels and show the results

[ForwardKernel,InverseKernel] = MyDCT(ImageSize);
DCT = ForwardKernel*I*ForwardKernel; % Matrix equation to apply DCT

figure(2);
imshow(uint8(DCT));
title("DCT of the Image");

IDCT = InverseKernel*DCT*InverseKernel; %Matrix Euation to apply IDCT
figure(3);
imshow(uint8(IDCT));
title("Image Recovered after IDCT");

%It is observed that in the DCT of the Image, whiter portion is at top left
%corner i.e al  high value DCT coeff  are concentrated at the top left of
%the DCT Matrix. So the energy is compressed at top left corner. Hence, the
%DCT theory is verified.
