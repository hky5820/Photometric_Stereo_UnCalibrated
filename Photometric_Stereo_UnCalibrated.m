function [image_albedo, normal_surface, svd_lightdir] = Photometric_Stereo_UnCalibrated(imarray)

%% SVD
size_image = size(imarray);
[U, S, V] = svd(reshape(imarray, [size_image(1)*size_image(2) size_image(3)]), 'econ');
V = V';

%% Get 3 Vectors in order of highest value
Top3_U = U(:, [1 : 3]);
Top3_S = S([1 : 3], [1 : 3]);
Top3_V = V([1 : 3], :);

%% Noral : U(mx3) * S(3x3), Light_Direction : V(3xn)
normal = Top3_U * Top3_S;
normal = reshape(normal, [size_image(1) size_image(2) 3]);
svd_lightdir = Top3_V;

%% albedo & normal calculation
image_albedo = (normal(:,:,1).^2 + normal(:,:,2).^2+ normal(:,:,3).^2).^0.5;
normal_surface = normal./repmat(image_albedo,[1 1 3]);
image_albedo = mat2gray(image_albedo);