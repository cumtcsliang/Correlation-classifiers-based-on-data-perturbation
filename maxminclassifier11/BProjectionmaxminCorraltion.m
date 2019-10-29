function [W2,ww,Weight2,ob]=BProjectionmaxminCorraltion(X,y,Para1, Para2, LabelMatrix,y1,Max_iter)
      
         Para3=1;
        InitalWeight=[];
        ExtendLabelMatrix=[];
for i=1:max(y)
            dd=find(y==i);
            InitalWeight=[InitalWeight ones(1,size(dd,1))];
                
            ExtendLabelMatrix=[ExtendLabelMatrix, LabelMatrix(:,i)*ones(1,size(dd,1))];
end
       K=zeros(size(X,2),size(X,2)); 
        K1=zeros(size(X,2),size(X,2));   
   for i=1:size(X,2)
    for   j=1:size(X,2)
         K(i,j)=X(:,i)'*X(:,j);
         K1(i,j)=ExtendLabelMatrix(:,i)'*ExtendLabelMatrix(:,j);
    end
   end

            u=1*norm(K.*K1/Para1+ExtendLabelMatrix'*ExtendLabelMatrix/Para3);
            
              

            Weight=InitalWeight;
            r=Weight';  
            temp=r;
            for iter=1:Max_iter
               
                if iter>1
                   
               r1=r+(iter/(iter+3))*(r-temp); 
               temp=r;
               r=r1;
            end
                
              r=(u*r+y1'*Para2-(K.*K1)*r/Para1-ExtendLabelMatrix'*ExtendLabelMatrix*r/Para3)/(u+Para2);
              r=min(max(r,0),1);
              Weight=r';
              %temp=r;
            %updatae projection vectors weight)
            W=zeros(size(X,1),size(LabelMatrix,1));
            w1=zeros(size(LabelMatrix,1),1);
            for j=1:size(X,2)
               w1=w1+Weight(1,j)*ExtendLabelMatrix(:,j);
                W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)'/Para1;
            end
              % W=W;
             % W=W*inv(LabelMatrix+1e-10);
            
                
                ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+(r'*(ExtendLabelMatrix'*ExtendLabelMatrix)*r)/2/Para3+Para2*sum(( r-y1').^2)/2;
               
             if iter==1
                     Weight2=Weight;
                       W2=W;
                       ww=w1;
                       Ob1=ob(iter,1);
                     
               end
               if iter>1
                   if ob(iter,1)<=Ob1
                       Weight2=Weight;
                       W2=W;
                       ww=w1;
                       Ob1=ob(iter,1);
                     
                   end
               end
              %update weight of each class
            
             %Weight=temptemp; %/sum(temptemp);
            end
                          
            
                
                 