function [WWW,ww,b]=MKernelmaxminCorraltion1(X,y,Para1,Para2, Max_iter, Rclass)
              nClass=max(y);
              [m,n]=size(X);
    for i=1:nClass          
   bin_labels = zeros(1,n);
   bin_labels(find(y==i)) = 1;
   bin_labels(find(y~=i)) = 2;   
   LabelMatrix=[1 -1
                -1 1];
            y3=bin_labels';
     %[X,y3]=correctLabel(X,bin_labels',0);
     if Rclass==0
      y1=ones(1,size(X,2));
     [w1,z1,ExtendLabelMatrix,Weight2,ob]=KernelmaxminCorraltion1(X,y3,Para1, Para2,LabelMatrix,y1,Max_iter,1);
     else
         y1=ones(1,size(X,2));
          [w1,z1,ExtendLabelMatrix,Weight2,ob]=PKernelmaxminCorraltion1(X,y3,Para1, Para2, LabelMatrix,y1,Max_iter,1);
     end
%[w,bb]=maxminCorraltion1(X,y3,Para1,Para2,LabelMatrix,1,500);
ww{1,i}=Weight2;
b{1,i}=w1;
WWW{1,i}=ExtendLabelMatrix;
    end