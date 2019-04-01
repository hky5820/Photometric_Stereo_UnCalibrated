function [img, max] = Loadpgm(name_file)

fid = fopen(name_file);
%% Check pgm or not
is_pgm = fscanf(fid, '%s', 1);
if(is_pgm ~= 'P5')
    error('This file is not PGM');
end

%% Get width
width = [];
while(isempty(width))
    [width, cnt] = fscanf(fid, '%d', 1);
    if(cnt == 0)
        fgetl(fid);
    end
end

%% Get height
height = fscanf(fid, '%d', 1);

%% Get max value of gray
max = fscanf(fid, '%d', 1);

%% Read data
cnt = fread(fid, 1); % new line
img = fread(fid, [width, height])';

%% Close file
fclose(fid);
