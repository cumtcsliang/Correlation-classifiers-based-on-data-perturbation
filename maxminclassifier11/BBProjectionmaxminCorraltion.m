function [W2,Weight2,ob]=BBProjectionmaxminCorraltion(X,y,Para1, Para2, LabelMatrix,y1,Max_iter)
      %  Max_iter=10
         %Para1=1;
         %Para2=1;
         %X=rand(10,5);
        % y=[1 1 2 2 3];
       % LabelMatrix=eye(3,3);
        % y1=[1 1 2 2 3]
         
       dd=find(y==1);
            InitalWeight=[ones(1,size(dd,1))/size(dd,1)];
                
            ExtendLabelMatrix=[ones(1,size(dd,1))];
            
           dd=find(y==2);
            InitalWeight=[InitalWeight ones(1,size(dd,1))/size(dd,1)];
                
            ExtendLabelMatrix=[ExtendLabelMatrix -ones(1,size(dd,1))];
            
            Weight=InitalWeight;
            C=repmat(ExtendLabelMatrix,size(X,1),1);
            XX=C.*X;
            u=1.01*norm(XX*XX'/Para1);
            
            r=Weight';     
     for iter=1:Max_iter
              r=(u*r+y1'*Para2-(XX'*XX)*r/Para1)/(u+Para2);
              r=min(max(r,0),1);
              Weight=r';
              
            %updatae projection vectors weight)
             W=zeros(size(X,1),1);
           for j=1:size(X,2)
                W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(1,j)/Para1;
            end
          
           
             % W=W*inv(LabelMatrix+1e-10);
            
                
                ob(iter,1)=(r'*(XX'*XX)*r)/(2*Para1)+Para2*sum(( r-1).^2)/2;
               
              if iter==1
                     Weight2=Weight;
                       W2=W;
                       Ob1=ob(iter,1);
                     
               end
               if iter>1
                   if ob(iter,1)<Ob1
                       Weight2=Weight;
                       W2=W;
                       Ob1=ob(iter,1);
                     
                   else 
                    %   break;
                   end
               end
              %update weight of each class
            
              % Weight=Weight1;
              
              
            
          
             %Weight=temptemp; %/sum(temptemp);
            end
                          