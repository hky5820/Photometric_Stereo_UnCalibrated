function Evaluation_Multiple_Direction(image_albedo, normal_surface)

min = 1/0;
min_light = [0, 0, 0];
for i = 0 : 0.1 : 2*pi
    figure(7);    
    image_evaluated = Evaluation(image_albedo, normal_surface, normalize([sin(i) cos(i) cos(i)],'norm'));
    imshow(mat2gray(image_evaluated));
    residual = (image_albedo - image_evaluated).^2;
    difference = sum(sum(residual(:,:)));
    if(min > difference)
        min = difference;
        min_light = normalize([sin(i) sin(i) 1],'norm');
    end
    title(['x : ' num2str(min_light(1)) ' y : ' num2str(min_light(2)) ' z : ' num2str(min_light(3)) ' min : ' num2str(min) ' diff : ' num2str(difference)]);
end

figure;
final_evaluated = Evaluation(image_albedo, normal_surface, [min_light]);
imshow(mat2gray(final_evaluated));
title(['x : ' num2str(min_light(1)) ' y : ' num2str(min_light(2)) ' z : ' num2str(min_light(3))]);