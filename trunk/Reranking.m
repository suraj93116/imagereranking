clear all; close all; clc; 
%*************parameters goes here****************
PeakThresh=5;
edgethresh=5;
%*****************************************************
Files = dir(strcat(pwd, '\images\*.jpg'));
 k(1)=1;  % mat tracker
 for m=1:length(Files)
     I= imread(strcat (pwd, '\images\',Files(m).name));
     I= single(rgb2gray(I));
     [f,d] = vl_sift(I,'PeakThresh', PeakThresh, 'edgethresh', edgethresh) ;
     if(m==1)
         %F=f;
         D=d;
         k(2)=size(f,2);
     else
         %F=horzcat(F, f);
         D=horzcat(D, d);
         k(m+1)=k(m)+size(f,2);
     end
 end
 
 Sw=zeros(length(Files),length(Files) );
 for m=1:length(Files)
     for n=1:m-1
        [matches, scores] = vl_ubcmatch(   D(:,k(m):k(m+1)), D(:, k(n):k(n+1)) );
        Sw(m,n)=size (matches,2)/ (k(m+1)+k(n+1)-k(m)-k(n));
        Sw(n,m)=Sw(m,n);
     end
 end
 
for m=1: length(Files)
    S= sum(Sw(m,:));
    Sw(m,:)=Sw(m,:)/S;
end

Rank= ones(1,length(Files))/length(Files)*Sw*Sw*Sw*Sw*Sw*Sw*Sw*Sw*Sw*Sw;

[B,ind]=sort(Rank);
for m=1:length(Files)
    eval(strcat('!rename',32, pwd, '\images\', int2str(ind(m)),'.jpg',32,int2str(length(Files)+1-m),'reranked.jpg'));
end
    
        
     
