function result = Preprocessing(imarray, ambimage, num_of_image)

%% Subtract the ambient image from other images
temp = imarray - repmat(ambimage, [1, 1, size(imarray, 3)]);

%% Threshold so that no pixel value is smaller than zero (negative)
temp = mat2gray(temp, [0 255]);

%% Crop the images so that only the face regions remain while the background and hair regions are excluded.
if num_of_image == 11
    result = zeros(151, 151, num_of_image);
    for i = 1 : num_of_image
        result(:,:,i) = imcrop(temp(:,:,i), [270 130 150 150]);
    end
else 
    result = temp;
end