function [w1,z1,ExtendLabelMatrix,Weight2,ob]=KernelmaxminCorraltion1(X,y,Para1, Para2, LabelMatrix,y1,Max_iter,Kerpara)
   b = stdv(X'); 
Kerpara=b*Kerpara;
% construct an rbf kernel in the form of exp(-||x||^2/b);
Para3=1;
        A=X';
        B=X';
       sA = (sum(A.^2, 2)); 
sB = (sum(B.^2, 2)); 
K2 = exp(bsxfun(@minus,bsxfun(@minus,2*A*B', sA), sB')/(2*b));
for u=1:size(K2,2)
 % K2(:,u)=K2(:,u)/norm(K2(:,u));
 end
      %  Max_iter=10
         %Para1=1;
         %Para2=1;
         %X=rand(10,5);
        % y=[1 1 2 2 3];
       % LabelMatrix=eye(3,3);
        % y1=[1 1 2 2 3]
       % m=floor(0.1*size(X,2));
        % P = OurINys(kernel,X', m, 'k');
        InitalWeight=ones(1,size(X,2));
        ExtendLabelMatrix=zeros(max(y),size(X,2));
for i=1:max(y)
            dd=find(y==i);
           
                
            ExtendLabelMatrix(:,dd)=LabelMatrix(:,i)*ones(1,size(dd,1));
   end
           K1=zeros(size(X,2),size(X,2));   
   for i=1:size(X,2)
    for   j=1:size(X,2)
        
         K1(i,j)=(ExtendLabelMatrix(:,i)'*ExtendLabelMatrix(:,j));
    end
   end   
    InitalWeight=InitalWeight/size(X,2);
   
            Weight=InitalWeight;
              u=1.0*(norm(K2.*K1/Para1+K1/Para3,Inf)+Para2);
            
              

            Weight=InitalWeight;
            r=Weight'; 
            temp=r;
            for iter=1:Max_iter
                 if iter>1
                   
                r1=r+(iter/(iter+3))*(r-temp); 
                temp=r;
                r=r1;
            end
              tttt=K2.*K1/Para1*r+K1*r+Para2*(log(max(r,0)+1e-20)+1-log((InitalWeight+1e-20)'));
             temptemp1=max(r,0).*exp(-tttt/u) ;
             temptemp2=zeros(size(X,2),1);
             for jj=1:max(y)
                 dd=find(y==jj);
                 sss=temptemp1(dd,1);
                temptemp2(dd,1)=sss/sum(sss);
            end
                r=temptemp2; %/sum(temptemp2); 
                 Weight=r';
         
            r=Weight';
              w1=zeros(size(LabelMatrix,1),1);
            for j=1:size(X,2)
               w1=w1+Weight(1,j)*ExtendLabelMatrix(:,j);
                %W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)'/Para1;
            end
               ob(iter,1)=(r'*(K2.*K1)*r)/(2*Para1)+(r'*(K1)*r)/2/Para3+Para2* sum((Weight+1e-20).*log((Weight+1e-20)./(InitalWeight+1e-20))) ;
                %ob(iter-1,1)=norm(Weight(:)-Wtemp(:));
%                 if ob(iter-1)/(norm(Weight(:))+1e-20)<1e-10
%                  % break 
%                 end
             
            if iter==1
                     Weight2=Weight;
                       w2=w1;
                       Ob1=real(ob(iter,1));
                     
               end
               if iter>1
                   if real(ob(iter,1))<=Ob1
                       Weight2=Weight;
                   w2=w1;
                       Ob1=real(ob(iter,1));
                     
                   end
               end
               
               
              %update weight of each class
             
             
             
             %Weight=temptemp; %/sum(temptemp);
            end
             z1=zeros(size(LabelMatrix,1),size(LabelMatrix,1));
            for i=1:size(K2,2)
                temp10=Weight2.*(K2(:,i)');
                z3=repmat(temp10,size(LabelMatrix,1),1);
                z4=sum(z3.*ExtendLabelMatrix,2);
                z1=z1+ExtendLabelMatrix(:,i)*Weight2(1,i)*z4';
            end
                                        
            
                
                 