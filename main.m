% Multimedia computing
clear;
clc;

format = 'YCbCr';
% Inputing the data

InputFunction;

% Converting the Images to Different colospace

ColorSpaceConversion;

% Forming Pixels containing the skin according to Y

ArrayFormation;
Yarray = Yarray(1:counter,:,:);

% Sorting the Array According to Y

[Y,I]=sort(Yarray(:,1));
SortedArray = Yarray(I,:);

% Selecting the Parameters


SelectingN;

i = 1:50:255;
plot(i,q1);

[ ~, index ] = min(q1);

N = i(index);

SelectingP;

i = 0.1:0.1:0.9;

plot(i,q1); 

[ ~, index ] = min(q1);

pop = i(index);

% Training the Network


[ BeginEnd, Mean, CovMat ] = DivideY(SortedArray, N);
 NInput = (BeginEnd(:,1) + BeginEnd(:,2) ) / 2;
 NOutput = [Mean,CovMat];
 net = NNPred(NInput,NOutput);
 
 % Testing
 
 Image = imread('test/5.jpg'); % Change the number from 1 to 7
 Mask  = imread('test/Mask/5.bmp'); % Change the number from 1 to 7
 
 [ Im1 ] = TestFile( Image , net, 0.25, format);% Format
  Error1 = Error (Mask , Im1);

figure(1);
imshow(Image);
title('Original');

figure(2);

imshow(Im1/255);
title(format);
xlabel(Error1);



