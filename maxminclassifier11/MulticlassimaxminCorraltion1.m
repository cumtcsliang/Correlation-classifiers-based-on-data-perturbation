function [ww,b]=MulticlassimaxminCorraltion1(X,y,Para1,Para2, Max_iter)
              nClass=max(y);
              [m,n]=size(X);
    for i=1:nClass          
   bin_labels = zeros(1,n);
   bin_labels(find(y==i)) = 1;
   bin_labels(find(y~=i)) = 2;   
   LabelMatrix=[1 -1
                -1 1];
     [X,y3]=correctLabel(X,bin_labels',0);
[w,bb]=maxminCorraltion1(X,y3,Para1,Para2,LabelMatrix,1,500);
ww{1,i}=w;
b{1,i}=bb;
    end


