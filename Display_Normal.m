function Display_Normal(normal_surface)

%% Convert normal_surface from double to grayscale
image_rgb_normal = mat2gray(normal_surface);

%% Display Normal and each axis of XYZ
figure;

%% Normal with RGB Channel
subplot(2, 2, 1);
imagesc(image_rgb_normal, [-1 1]);
colorbar; axis equal; axis tight; axis off;
title('Normal with RGB Channel');

%% Display X axis
subplot(2, 2, 2);
imagesc(normal_surface(:,:,1), [-1 1]);
colorbar; axis equal; axis tight; axis off;
title('X');

%% Display Y axis
subplot(2, 2, 3);
imagesc(normal_surface(:,:,2), [-1 1]);
colorbar; axis equal; axis tight; axis off;
title('Y');

%% Display Z axis
subplot(2, 2, 4);
imagesc(normal_surface(:,:,3), [-1 1]);
colorbar; axis equal; axis tight; axis off;
title('Z');