%uniformQuant separates the image into r, g, and b, then individually
%quantizes each channel
function output = uniformQuant(imageFileName, rgbBitDepth)

% Load image
img = imageFileName;

% Create an array the same size and dimension as 'img' and initialize all
% elements to 0
output = zeros(size(img));

% Loop through each r, g, and b channels
for i = 1:3
    % Quantize each channel
    output(:, :, i) = quantizeChannel(img(:, :, i), rgbBitDepth(i));
end

end

% quantizeChannel quantizes a single channel of an image. 'channel' is a
% single channel of an image. 'bitDepth' is the number of bits for each
% color channel of a pixel
function quantized = quantizeChannel(channel, bitDepth)

% Determine the number of levels to use for quantization from bitDepth
lvls = 2^bitDepth;

% Calculate the quantization interval for quantization based on lvls
quantizationInterval = 256 / lvls;

% Apply quantization by dividing the channel values by quantizationInterval
% (taken from slides), rounding to nearest integer, and multiplying the
% result by the quantizationInterval to map each quantization level to the
% intensity for that level
quantized = round(channel / quantizationInterval) * quantizationInterval;

end