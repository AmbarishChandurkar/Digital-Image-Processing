%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 3 January 2020
% This MATLAB function encapsulates the algorithm of "Histogram Specification"
% Ref : S.Sridhar, Digital Image Processing, 2e
%% Output = 'Mapping' is the resultant matrix after Histogram Specification is Done
clc;clearvars
%% Demo on the following Original and Target Histograms
I_OrigEqualisedHist = [0,1,2,4,5,7,7,7];
I_TargetEqualisedHist = [0,0,0,0,2,3,6,7];
%% Find the Mappings
NearestTargetPtr = 1; %Points to the current mapping value
LUT = [(0:1:I_OrigEqualisedHist(end))',zeros(numel(0:1:I_OrigEqualisedHist(end)),1)];
%LUT = Look Up Table
for Row = 1:1:I_OrigEqualisedHist(end)+1
    while I_OrigEqualisedHist(Row) > I_TargetEqualisedHist(NearestTargetPtr)...
            && NearestTargetPtr ~= I_OrigEqualisedHist(end) + 1
        NearestTargetPtr = NearestTargetPtr + 1;
    end
    LUT(Row,2) = NearestTargetPtr - 1;
end
Mapping = LUT;
%% Performing the Specification
