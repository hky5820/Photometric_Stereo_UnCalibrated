close all;
clear;
clc;

path_data = 'data';
name_subject = 'yaleB01';
num_image = 11;
path_output = fullfile('..','output');
path_image  = fullfile(path_data, name_subject);

ICV_Photometric_Stereo_UnCalibrated(path_image, name_subject, num_image);