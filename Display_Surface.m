function Display_Surface(image_albedo, surface)

[height, width] = size(surface);
[x,y] = meshgrid(1:width, 1:height);
surf = flipud(fliplr(surface));
albedo = flipud(fliplr(image_albedo));

figure;
mesh(surf, x, y, albedo);
axis equal;
xlabel('Z');
ylabel('X');
zlabel('Y');
title('Surface');
colormap(gray);