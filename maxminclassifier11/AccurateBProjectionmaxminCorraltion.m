function [W2,Weight2,ob]=AccurateBProjectionmaxminCorraltion(X,y,Para1, Para2, LabelMatrix,y1,Max_iter)
     ob=0;
%  Max_iter=10
         %Para1=1;
         %Para2=1;
         %X=rand(10,5);
        % y=[1 1 2 2 3];
       % LabelMatrix=eye(3,3);
        % y1=[1 1 2 2 3]
         
        InitalWeight=[];
        ExtendLabelMatrix=[];
for i=1:max(y)
            dd=find(y==i);
            InitalWeight=[InitalWeight ones(1,size(dd,1))/size(dd,1)];
                
            ExtendLabelMatrix=[ ExtendLabelMatrix, LabelMatrix(:,i)*ones(1,size(dd,1))];
end
       K=zeros(size(X,2),size(X,2)); 
        K1=zeros(size(X,2),size(X,2));   
   for i=1:size(X,2)
    for   j=1:size(X,2)
         K(i,j)=X(:,i)'*X(:,j);
         K1(i,j)=trace(ExtendLabelMatrix(:,i)*ExtendLabelMatrix(:,j)');
    end
   end

           % u=1.01*norm(K.*K1/Para1);
            
              

            Weight=InitalWeight;
            r=Weight'; 
            
            
            H=(K.*K1)/Para1+Para2*eye(size(K1,1),size(K1,2)); 
            f=-Para2*ones(size(K1,1),1);
           options = optimoptions('quadprog','Algorithm','interior-point-convex');
[x,fval,exitflag,output] = quadprog(H,f,[],[],[],[],0*ones(size(K1,1),1),ones(size(K1,1),1),[],options); 
       
            
                
                 
            
         Weight2=x';
         
           W=zeros(size(X,1),size(LabelMatrix,1));
            for j=1:size(X,2)
                W=W+Weight2(1,j)*X(:,j)*ExtendLabelMatrix(:,j)'/Para1;
            end
               W2=W;
             % W=W*inv(LabelMatrix+1e-10);
            
                
               % ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+Para2*sum(( r-1).^2)/2;
               
           
                          
            
                
                 