function [ambimage,imarray,lightdirs] = LoadFaceImages(path_image, name_subject, num_image)

%% Load ambient image
name_file = fullfile(path_image, [name_subject '_P00_Ambient.pgm']);
ambimage = Loadpgm(name_file);
[height, width] = size(ambimage);

%% List of all other files
files = dir(fullfile(path_image, [name_subject '_P00A*.pgm']));
% name, dir, date, bytes, isdir, datenum ...

%% Get name list of files
name_files = {files(:).name};
num_total_image = numel(name_files);

if(num_image > num_total_image)
    fprintf('num_image가 load한 이미지보다 큽니다.\n');
end

%% Array to store angle of ligth sources
angle = zeros(2, num_total_image);

%% Array to store illuminated images
imarray = zeros(height, width, num_total_image);

for j = 1 : num_total_image
    index = findstr(name_files{j},'A')+1;
    angle(1,j) = str2num(name_files{j}(index:(index+3)));
    index = findstr(name_files{j},'E')+1;
    angle(2,j) = str2num(name_files{j}(index:(index+2)));
    imarray(:,:,j) = Loadpgm(fullfile(path_image, name_files{j}));
end

%% Convert angle to cartesian coordiantes
[X,Y,Z]= sph2cart(pi*angle(1,:)/180,pi*angle(2,:)/180,1);
lightdirs = [Y;Z;X];
lightdirs = lightdirs';