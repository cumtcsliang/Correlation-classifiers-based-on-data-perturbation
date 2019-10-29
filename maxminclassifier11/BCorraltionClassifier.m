function errorRate=BCorraltionClassifier(X,y,W)
   y1=zeros(size(y,1),1);
for i=1:size(X,2)
       
     % for j=1:size(LabelMatrix,1)
           % %temp(1,j)=LabelMatrix(:,j)'*W'*X(:,i)/norm(W'*X(:,i));
          % temp(1,j)=(LabelMatrix(:,j)'*W'*X(:,i))/(norm(LabelMatrix(:,j)'*W')*norm(X(:,i)));
    %  end
    
      %
    
          if W'*X(:,i)>=0
           y1(i,1)=1;
          else y1(i,1)=2;
          end
end
z=(y==y1);
errorRate=1-sum(z,1)/size(y,1);

       
          
