function image_evaluated = Evaluation_With_Direction(image_albedo, normal_surface, direction_light)

size_image = size(image_albedo);
row = size_image(1);
column = size_image(2);

image_evaluated = zeros(row,column);
for i = 1 : row
    for j = 1 : column
        normal = reshape(normal_surface(i,j,:), [1 3]);
        image_evaluated(i, j) = sum(normal .* direction_light) * image_albedo(i,j);
    end
end

figure;
% imshow(mat2gray(image_evaluated));
imshow(image_evaluated);
title(['Evaluation with' num2str(direction_light(1)) num2str(direction_light(2)) num2str(direction_light(3))]);