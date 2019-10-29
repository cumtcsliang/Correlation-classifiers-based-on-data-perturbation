function errorRate=MKernelCorraltionClassifier(X,y,w11,LabelMatrix22,Weight1,K3)
   y1=zeros(size(y,1),1);
for i=1:size(X,2)
       temp=zeros(1,max(y));
       
      for j=1:max(y)
                      Weight=Weight1{1,j};
                      LabelMatrix2=LabelMatrix22{1,j};
                      w1=w11{1,j};
                      
                  sss=sum(([1 -1]*LabelMatrix2).*Weight.*X(:,i)')+[1 -1]*w1;
                      dd1=(LabelMatrix2(1,:).*Weight);
                      sss=sss/(dd1*K3*dd1');
                  
                  %/norm((LabelMatrix(:,j)'*LabelMatrix2).*Weight);
                 % sss=sss/sqrt(LabelMatrix(:,j)'*z1*LabelMatrix(:,j));
                  temp(1,j)=sss;
      end
      %sss1=(LabelMatrix2*(Weight.*X(:,i)')');
       [d,index]=max(temp);
        %[d,index]=max(sss1);
       %if index/2
      %
     
           y1(i,1)=ceil(index);
     
end
z=(y==y1);
errorRate=1-sum(z,1)/size(y,1);