function [W,ww,Weight2,ob]=AccuratemaxminCorraltion(X,y,Para1,Para2, LabelMatrix,y1,Max_iter)
      %  Max_iter=10
         %Para1=1;
         %Para2=1;
         %X=rand(10,5);
        % y=[1 1 2 2 3];
       % LabelMatrix=eye(3,3);
        % y1=[1 1 2 2 3]
        ob=1;
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
            Weight=InitalWeight;
           
            
            r=Weight';
                
           %updatae projection vectors weight)
           
              save templiang K K1 ExtendLabelMatrix Weight InitalWeight
               f = @(x)parameterfun(x,Para1,Para2);
               [r,fval] = fmincon(f,r,[],[],[],[],0*ones(size(X,2),1),1*ones(size(X,2),1));
              
              % ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+(r'*(ExtendLabelMatrix'*ExtendLabelMatrix)*r)/2/Para3+Para2* sum(Weight.*log(Weight./(InitalWeight)+1e-20)) ;
              
               W=zeros(size(X,1),size(LabelMatrix,1));
            w1=zeros(size(LabelMatrix,1),1);
            for j=1:size(X,2)
                W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)';
                w1=w1+Weight(1,j)*ExtendLabelMatrix(:,j)/Para3;
            end
               W=W/Para1;
               ww=w1;
               Weight2=r';
         
             
              
              
            
            
         
                
                 