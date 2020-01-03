%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 3 January 2019
% This MATLAB function encapsulates the algorithm of "Histogram Equalisation"
% as mentioned on wikipedia URL :- https://en.wikipedia.org/wiki/Histogram_equalization
% Demo working is given in a separate Script

function I_HistEq = MyHistEq(ImageName)
%% Initialisation
clc; clearvars; close all;

%% Read the image and also get the dimensions
I = imread(ImageName);
[Row,Col,Depth] = size(I);

%% Convert the image to grayscale and then to 1-D Array
if(Depth > 1)
    I = rgb2gray(I);
end
I_Original = reshape(I,[1,Row*Col]);

%% Now we count all the unique values in the Image Matrix
I_Original_UniqVal = unique(I_Original); %Get the unique values
Count = zeros(1,numel(I_Original_UniqVal)); %Initialize a count array

for idx = 1:length(I_Original_UniqVal) %Counting of values using "Logical Indexing"
    Count(idx) = sum(I_Original == I_Original_UniqVal(idx));
end

%% Find the Cumulative Frequency Distribution

I_CDF = cumsum(Count);
I_CDF_Min = min(I_CDF);
%% Finally, we perform equalisation, using the formula given on wikipedia

I_HistEq = zeros(1,numel(I_Original));
for idx = 1:1:length(I_Original)
    I_HistEq(idx) = round(((I_CDF(I_Original_UniqVal == I_Original(idx)) - I_CDF_Min)...
                            /((Row*Col) - I_CDF_Min)) * 255);
end

% L-1 = 256 -1 = 255, where '256' is no. of grey levels.
%In order to get the CDF Value for an element, we need its index.
%So, to get that, we use "Logical Indexing" in the part => I_Original_UniqVal == I_Original(idx)
% Note that I_Original_UniqVal and I_CDF have SAME index for a given
% element.
%% Reconstruct Back the 2-D Image
I_HistEq = reshape(I_HistEq,[Row,Col]);
I_HistEq = cast(I_HistEq,'uint8'); %Typecasting is needed, since matrix is "double"
end