function ICV_Photometric_Stereo_UnCalibrated(path_image, name_subject, num_image)

%% Load Image
[ambimage, imarray, lightdirs] = LoadFaceImages(path_image, name_subject, num_image);

%% Preprocessing
imarray = Preprocessing(imarray, ambimage, num_image);

%% Photometric Stereo
[image_albedo, normal_surface, svd_lightdir] = Photometric_Stereo_UnCalibrated(imarray);

%% Calculate Surface
surface = Calc_Surface(normal_surface);

%% Display Albedo Map
Display_Albedo(image_albedo);

%% Display Surface Normals with each axis
Display_Normal(normal_surface);

%% Display Surface
Display_Surface(image_albedo, surface);

%% Evaluate in Different Direction
Evaluation_With_Direction(image_albedo, normal_surface, [0 0 1]);
Evaluation_With_Direction(image_albedo, normal_surface, [0 0 -1]);
Evaluation_Multiple_Direction(image_albedo, normal_surface);