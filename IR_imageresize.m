function [ ] = IR_imageresize( scale_v, scale_h )
%IR_IMAGERESIZE Summary of this function goes here
%   Detailed explanation goes here
Files= dir(strcat(pwd, '\images\*.jpg'));
for i=1:length(Files)
    A= imread(strcat(pwd, '\images\', Files(i).name));
    A=imresize(A, [scale_v scale_h]);
    imwrite(A, strcat(pwd, '\images\', Files(i).name));
end

