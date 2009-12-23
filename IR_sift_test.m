function [] = IR_randomname(a, b)  % the size of the two images must be the same
Files= dir(strcat(pwd, '\images\*.jpg'));
pfx= fullfile(pwd, 'images', Files(a).name);    

Ia_original= imread(pfx);
Ia= single(rgb2gray(Ia_original));
[fa,da] = vl_sift(Ia,'PeakThresh', 5, 'edgethresh', 5) ;

pfx= fullfile(pwd, 'images', Files(b).name);
Ib_original= imread(pfx);
Ib= single(rgb2gray(Ib_original));
[fb,db] = vl_sift(Ib,'PeakThresh', 5, 'edgethresh', 5) ;
% image(Ib_original);
% h1   = vl_plotframe(fb) ; 

[matches, scores] = vl_ubcmatch(da, db, 2.5);

I= cat(2,Ia_original,Ib_original);
imshow(I);
hold on;
for i=1:size(matches,2)
    line([fa(1,matches(1,i)),fb(1,matches(2,i))+size(Ia_original,2)],...
    [fa(2,matches(1,i)),fb(2,matches(2,i))],...
    'Color','r');    
end






