%% Author : Ambarish Prashant Chandurkar (BT17ECE021)
%% Date : 13 March 2020
%In this is Script the Image is converted to 1-D Array using Zig-Zag Scanning

function OneD_Image = ZigZag(TwoD_Image)
%% Part 1 : Import the Image
I = imread(TwoD_Image);
I = rgb2gray(I);

%% Part 2 : Start the Zig Zag Scanning
[xend, yend] = size(I); %Horizontal and Vertical limits of Scan
OneD_Image = [];
for idx = 1:1:2 % Scanning is done separately for 2 diagonal halves of the image
    
    x0 = 1;y0 = 1; %First Point of the Image
    r = y0;c = x0; %Variables for parsing the image

    OneD_Image = [OneD_Image,I(r,c)];
    while(c ~= xend && r ~= yend) %Scan within the limits of the image

        c = x0 + 1; %First move 1 unit right
        OneD_Image = [OneD_Image,I(r,c)];

        while(c ~= 1) %Then move digonally towards the leftmost point
            c = c-1;
            r = r+1;
            OneD_Image = [OneD_Image,I(r,c)];
        end

        %Different conditions in case Even/Odd total pixels
        if(r == yend)%For Even no. of total pixels, we need to move horizontally rightwards 1 unit
            c = c + 1; 
            OneD_Image = [OneD_Image,I(r,c)];
            while(c ~= xend)
                r = r-1;
                c = c+1;
                OneD_Image = [OneD_Image,I(r,c)];
            end
        else %For odd no. of total pixels we need to move vertically downwards 1 unit
            r = r + 1;
            OneD_Image = [OneD_Image,I(r,c)];
            while(r ~= 1)
                r = r-1;
                c = c+1;
                OneD_Image = [OneD_Image,I(r,c)];
            end
        end

        x0 = c; %Storing the previous position while turning diagonally from corners
        y0 = r;
    end
    I = rot90(rot90(I)); % Now we scan the remaining half, by rotating the image by 180 degrees
end

    if(mod(xend*yend,2) ~= 0) %For odd no. of pixels case
        OneD_Image((xend*yend)+1:(xend*yend) + xend) = []; %Diagonal was repeated, so remove it
        OneD_Image(3*xend+1:(xend*yend)) = fliplr(OneD_Image(3*xend+1:(xend*yend)));
        % We need to rotate the scan of other half by 180 degree again

    else % For even no. of pixels
        OneD_Image((xend*yend)+1 : numel(OneD_Image)) = [];
        OneD_Image(3*xend+2:(xend*yend)) = fliplr(OneD_Image(3*xend+2:(xend*yend)));
    end
end