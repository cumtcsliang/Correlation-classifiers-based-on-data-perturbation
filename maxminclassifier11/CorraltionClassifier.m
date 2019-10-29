function errorRate=CorraltionClassifier(X,y,LabelMatrix,W,ww,extend)
   y1=zeros(size(y,1),1);
for i=1:size(X,2)
       temp=zeros(1,max(y));
       
      for j=1:size(LabelMatrix,1)
           %temp(1,j)=LabelMatrix(:,j)'*W'*X(:,i)/norm(W'*X(:,i));
           temp(1,j)=(LabelMatrix(:,j)'*(W'*X(:,i)+ww))/(norm(W(:,j)));
             %temp(1,j)=(W(:,j)'*X(:,j)+ww(j,1))/norm(W(:,j));
      end
     %  %[d,index]=max(W'*X(:,i)+ww);
    [d,index]=max(temp);
       %if index/2
     
      if extend==1
      y1(i,1)=ceil(index/2);
      else
           y1(i,1)=ceil(index);
      end
end
z=(y==y1);
errorRate=1-sum(z,1)/size(y,1);

       
          
