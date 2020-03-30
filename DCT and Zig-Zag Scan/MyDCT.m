%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%This function, calculates the Forward and Reverse transformation kernel of DCT
% Ref : DIP, S. Sridhar

function [DCTKernel,IDCTKernel] = MyDCT(ImageSize)
%% Part 1 : Formation of Forward DCT Kernel
N = ImageSize;
A = zeros(N);
w = 1/sqrt(2);
for u = 0:1:N-1
    for x = 0:1:N-1
        A(u+1,x+1) = sqrt(2)*(w/sqrt(N))*cos(((2*x + 1)/(2*N))*u*pi);
    end
    w = 1; %After 1st iteration, w = 1, since by defn w = 1 when u /= 0
end

%% Part 2 : Forward and Reverse Kernel

DCTKernel = A;
IDCTKernel = A';
end
