
% Initialization
clear ; close all; clc

%% =========== Load Image =============
fprintf('Loading the image ...\n');
% read the image
img = imread('bluebird.jpeg');
% display the image
imshow(img)

% scale the pixel values so that they fall within [0,1]
img = double(img)/255;

%% =========== Perform PCA to Compress the Image =============
% Instructions: The following code perform PCA on each color channel to 
%               reduce feature dimensions. Tune the value of K to see its impact.  
%               
fprintf('Compressing the image ...\n');

K = 100;  % number of principle components 

% find the number of RGB pixels in the image
[n,m,c] = size(img);
img_compressed = zeros(n,m,c);
for rgb = 1:3
    % Center the data 
    X = img(:,:,rgb) - mean(img(:,:,rgb));
    

    W = findPCs(X, K);
    Xt = PCAtransform(X,W);
    X_inv = PCAtransform_inv(Xt,W);
    img_compressed(:,:,rgb) = X_inv;

end

img_compressed = uint8(img_compressed*255);
% store the compressed image 
imwrite(img_compressed, 'bluebird_compressed.jpeg');
% display the compressed image
fprintf('Compression is done. \n');
figure;
imshow(img_compressed)

