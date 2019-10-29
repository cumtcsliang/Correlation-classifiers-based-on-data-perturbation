function [W1,Weight,ob]=KernelmaxminCorraltion(X,y,Para1, Para2, LabelMatrix,y1,Max_iter,Kerpara)
   b = stdv(X'); 
Kerpara=b;
% construct an rbf kernel in the form of exp(-||x||^2/b);
kernel = struct('type', 'rbf', 'para', b); 
        A=X';
        B=X';
       sA = (sum(A.^2, 2)); 
sB = (sum(B.^2, 2)); 
K2 = exp(bsxfun(@minus,bsxfun(@minus,2*A*B', sA), sB')/Kerpara);
for u=1:size(K2,2)
  K2(:,u)=K2(:,u)/norm(K2(:,u));
 end
      %  Max_iter=10
         %Para1=1;
         %Para2=1;
         %X=rand(10,5);
        % y=[1 1 2 2 3];
       % LabelMatrix=eye(3,3);
        % y1=[1 1 2 2 3]
        m=floor(0.1*size(X,2));
         P = OurINys(kernel,X', m, 'k');
        InitalWeight=[];
        ExtendLabelMatrix=[];
for i=1:max(y)
            dd=find(y==i);
            InitalWeight=[InitalWeight ones(1,size(dd,1))/size(dd,1)];
                
            ExtendLabelMatrix=[ ExtendLabelMatrix, LabelMatrix(:,i)*ones(1,size(dd,1))];
   end
            
            Weight=InitalWeight;
            for iter=1:Max_iter
            
            %updatae projection vectors weight)
            W0=zeros(size(K2,1),size(LabelMatrix,1));
            
            for j=1:size(K2,2)
                W0=W0+Weight(1,j)*K2(:,j)*ExtendLabelMatrix(:,j)'/Para1;
            end
            if iter==1
                InitalWeight=zeros(size(K2,1),size(LabelMatrix,1));
           [ W1,ob]=OurPCG(K2,W0,100,InitalWeight, P);
           %P1=inv(P);
           %W2=pcg(K2,W0,1e-5,100);
            else
                [ W1,ob]=OurPCG(K2,W0,100,W2, P);
            end
            W2=W1;
            % W=W/size(X,2);
              %W=W*pinv(LabelMatrix+1e-10);
            if iter>1
                
                ob(iter-1,1)=norm(W1(:)-Wtemp(:));
                if ob(iter-1)<1e-6
                   % break 
                end
            end
            
              %update weight of each class
              Weight1=[];
              temp=0;
              for ss=1:max(y)
                    dd=find(y==ss);
                    temptemp=[];
                     for tt=1:max(size(dd,1))
                          temp=temp+1;
                          temptemp(1,tt)=y1(1,temp)*exp(-ExtendLabelMatrix(:,temp)'*W1'*K2(:,temp)/(size(K2,2)*Para2));
                    end
                    temptemp=temptemp/(sum(temptemp)+1e-10);
                      Weight1=[Weight1 temptemp];
              end
              
             Weight=Weight1;
             Wtemp=W1;
             %Weight=temptemp; %/sum(temptemp);
            end
                          
            
                
                 