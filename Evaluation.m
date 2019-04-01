function image_evaluated = Evaluation(image_albedo, normal_surface, direction_light)

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