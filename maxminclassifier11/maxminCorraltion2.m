function [W2,ww,Weight2,ob]=maxminCorraltion2(X,y,Para1,Para2, LabelMatrix,y1,Max_iter)
      %  Max_iter=10
         %Para1=1;
         %Para2=1;
         %X=rand(10,5);
        % y=[1 1 2 2 3];
       % LabelMatrix=eye(3,3);
        % y1=[1 1 2 2 3]
        Para3=1; 
        InitalWeight=[];
        ExtendLabelMatrix=[];
for i=1:max(y)
            dd=find(y==i);
            InitalWeight=[InitalWeight ones(1,size(dd,1))];
                
            ExtendLabelMatrix=[ExtendLabelMatrix LabelMatrix(:,i)*ones(1,size(dd,1))];
end
      K=zeros(size(X,2),size(X,2)); 
      K1=zeros(size(X,2),size(X,2));   
   for i=1:size(X,2)
    for j=1:size(X,2)
         K(i,j)=X(:,i)'*X(:,j);
         K1(i,j)=(ExtendLabelMatrix(:,i)'*ExtendLabelMatrix(:,j));
    end
   end
            
            
        u=1.0*(norm(K.*K1/Para1+K1/Para3,Inf)+Para2);
            
              InitalWeight=InitalWeight/size(X,2);

            Weight=InitalWeight;
            r=Weight'; 
            
            temp=r;
            
            for iter=1:Max_iter
            ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+(r'*(K1)*r)/2+real(Para2* sum((r'+1e-20).*log((r'+1e-20)./(InitalWeight+1e-20)))) ; 
          
             if iter>1
                   
                r1=r+(iter/(iter+3))*(r-temp); 
                temp=r;
                r=r1;
            end
            tttt=K.*K1/Para1*r+K1*r+real(Para2*(log(max(r,0)+1e-20)+1-log((InitalWeight+1e-20)')));
             temptemp1=temp.*exp(-tttt/u) ;
             temptemp2=[];
             for jj=1:max(y)
                 dd=find(y==jj);
                 sss=temptemp1(dd,1);
                temptemp2=[temptemp2;sss];
             end
           temptemp2=temptemp2/sum(temptemp2);
                r=temptemp2; 
                 Weight=r';
                 %temp=r;
          
            W=zeros(size(X,1),size(LabelMatrix,1));
            w1=zeros(size(LabelMatrix,1),1);
            for j=1:size(X,2)
                W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)';
                 w1=w1+Weight(1,j)*ExtendLabelMatrix(:,j)/Para3;
            end
               W=W/Para1;
               r=Weight';
               
             % ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+Para2* sum(Weight.*log(Weight./(InitalWeight))) ;
               
             
         
             
             
                  
               
                     
           if iter>7
              ss=(ob(iter,1)-ob(iter-6,1));
              if ss==0
             %  break;
               end
           end
             
              
              
           %  Weight= temptemp;
             
        
           if iter==1
                     Weight2=Weight;
                       W2=W;
                       Ob1=abs(ob(iter,1));
                      ww=w1;
               end
               if iter>1
                if abs(ob(iter,1))<=abs(Ob1)
                       Weight2=Weight;
                       W2=W;
                       ww=w1;
                       Ob1=abs(ob(iter,1));
                     
                  end
               end
            end
         %   t=1;
                
                 