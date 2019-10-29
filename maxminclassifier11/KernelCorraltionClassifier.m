function errorRate=KernelCorraltionClassifier(w1,z1,X,y,LabelMatrix,LabelMatrix2,Weight,extend)
   y1=zeros(size(y,1),1);
for i=1:size(X,2)
       temp=zeros(1,max(y));
       
      for j=1:size(LabelMatrix,1)
          
                  sss=sum((LabelMatrix(:,j)'*LabelMatrix2).*Weight.*X(:,i)')+LabelMatrix(:,j)'*w1;
                  
                  %/norm((LabelMatrix(:,j)'*LabelMatrix2).*Weight);
                 % sss=sss/sqrt(LabelMatrix(:,j)'*z1*LabelMatrix(:,j));
                  temp(1,j)=sss;
      end
      %sss1=(LabelMatrix2*(Weight.*X(:,i)')');
       [d,index]=max(temp);
        %[d,index]=max(sss1);
       %if index/2
      %
      if extend==1
      y1(i,1)=ceil(index/2);
      else
           y1(i,1)=ceil(index);
      end
end
z=(y==y1);
errorRate=1-sum(z,1)/size(y,1);
