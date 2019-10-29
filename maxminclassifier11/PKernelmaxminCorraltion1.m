function [w1,z1,ExtendLabelMatrix,Weight,ob]=PKernelmaxminCorraltion1(X,y,Para1, Para2, LabelMatrix,y1,Max_iter,Kerpara)
   b = stdv(X'); 
Kerpara=b*Kerpara;
% construct an rbf kernel in the form of exp(-||x||^2/b);

        A=X';
        B=X';
       sA = (sum(A.^2, 2)); 
sB = (sum(B.^2, 2)); 
K2 = exp(bsxfun(@minus,bsxfun(@minus,2*A*B',sA), sB')/(2*b));
for u=1:size(K2,2)
 % K2(:,u)=K2(:,u)/norm(K2(:,u));
 end
     
        Para3=1;
         InitalWeight=ones(1,size(X,2));
        ExtendLabelMatrix=zeros(max(y),size(X,2));
for i=1:max(y)
            dd=find(y==i);
          %  InitalWeight=[InitalWeight ones(1,size(dd,1))/size(dd,1)];
                
            ExtendLabelMatrix(:,dd)=LabelMatrix(:,i)*ones(1,size(dd,1));
end
            %  K=zeros(size(X,2),size(X,2)); 
        K1=zeros(size(X,2),size(X,2));   
   for i=1:size(X,2)
    for   j=1:size(X,2)
        
         K1(i,j)=(ExtendLabelMatrix(:,i)'*ExtendLabelMatrix(:,j));
    end
   end

            u=1.1*norm(K2.*K1/Para1+ExtendLabelMatrix'*ExtendLabelMatrix/Para3);
            
              

            Weight=InitalWeight;
            r=Weight'; 
   
   temp=r;


         
            for iter=1:Max_iter
           if iter>1
                   
                r1=r+(iter/(iter+3))*(r-temp); 
                temp=r;
                r=r1;
            end
            r=(u*r+y1'*Para2-(K2.*K1)*r/Para1-ExtendLabelMatrix'*ExtendLabelMatrix*r/Para3)/(u+Para2);
              r=min(max(r,0),1);
              Weight=r';
            %updatae projection vectors weight)
        
             % W=W*inv(LabelMatrix+1e-10);
             w1=zeros(size(LabelMatrix,1),1);
            for j=1:size(X,2)
               w1=w1+Weight(1,j)*ExtendLabelMatrix(:,j);
              %  W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)'/Para1;
            end
              % W=W;
             % W=W*inv(LabelMatrix+1e-10);
            
                
                ob(iter,1)=(r'*(K2.*K1)*r)/(2*Para1)+(r'*(ExtendLabelMatrix'*ExtendLabelMatrix)*r)/2/Para3+Para2*sum(( r-y1').^2)/2;
                
               % ob(iter,1)=(r'*(K2.*K1)*r)/(2*Para1)+Para2*sum(( r-1).^2)/2;
               
             if iter==1
                    
                       Ob1=ob(iter,1);
                     
               end
               if iter>1
                    if ob(iter,1)<=Ob1
                       Ob1=ob(iter,1);
                         
                    end;
               end
            
            
           

            end
            z1=zeros(size(LabelMatrix,1),size(LabelMatrix,1));
%             for i=1:size(K2,2)
%                 temp10=Weight.*(K2(:,i)');
%                 z3=repmat(temp10,size(LabelMatrix,1),1);
%                 z4=sum(z3.*ExtendLabelMatrix,2);
%                 z1=z1+ExtendLabelMatrix(:,i)*Weight(1,i)*z4';
%             end
                          
            