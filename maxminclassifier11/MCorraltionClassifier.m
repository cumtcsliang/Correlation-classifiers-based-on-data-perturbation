function errorRate=MCorraltionClassifier(X,y,W,ww)
   y1=zeros(size(y,1),1);
for i=1:size(X,2)
       temp=zeros(1,max(y));
       
      for j=1:max(y)
           %temp(1,j)=LabelMatrix(:,j)'*W'*X(:,i)/norm(W'*X(:,i));
           %temp(1,j)=(W(:,j)'*X(:,i)+ww(1,j))/norm(W(:,j));
                W1=W{1,j};
                www=ww{1,j};
             temp(1,j)=[1 -1]*(W1'*X(:,i)+www)/norm(W1(:,1));
      end
     %  %[d,index]=max(W'*X(:,i)+ww);
    [d,index]=max(temp);
       %if index/2
     
     
     
           y1(i,1)=ceil(index);
     
end
z=(y==y1);
errorRate=1-sum(z,1)/size(y,1);

       