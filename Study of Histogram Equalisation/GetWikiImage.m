%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 3 January 2019
%This script is to create the 8X8 image from matrix 
clc;clearvars;close all;
%% The 8 X 8 Matrix as on Wikipedia is given below

WikiImage = [52	,55,61,	59,	79,	61,	76,	61;
            62,	59,	55,	104,94,	85,	59,	71;
            63,	65,	66,	113, 144,104,63,72;
            64,	70,	70,	126,154,109,71,	69; %Same matrix as on Wikipedia
            67,	73,	68,	106,122,88,	68,	68;
            68,	79,	60,	70,	77,	66,	58,	75;
            69,	85,	64,	58,	55,	61,	65,	83;
            70,	87,	69,	68,	65,	73,	78,	90];    

WikiImage = cast(WikiImage,'uint8');  %'double' => 'uint8' conversion
imwrite(WikiImage,"WikiImage.png");