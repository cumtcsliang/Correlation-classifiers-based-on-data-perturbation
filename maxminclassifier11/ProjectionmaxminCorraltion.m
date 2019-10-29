function [W2,Weight2,ob]=ProjectionmaxminCorraltion(X,y,Para1, Para2, LabelMatrix,y1,Max_iter)
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
            
            Weight=InitalWeight;
            for iter=1:Max_iter
            
            %updatae projection vectors weight)
            W=zeros(size(X,1),size(LabelMatrix,1));
            
            for j=1:size(X,2)
                W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)'/Para1;
            end
               W=W;
             % W=W*inv(LabelMatrix+1e-10);
            
                
                ob(iter,1)=norm(W(:))^2;
               
             if iter==1
                     Weight2=Weight;
                       W2=W;
                       Ob1=ob(iter,1);
                     
               end
               if iter>1
                   if ob(iter,1)>=Ob1
                       Weight2=Weight;
                       W2=W;
                       Ob1=ob(iter,1);
                     
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
                          temptemp(1,tt)=y1(1,temp)-ExtendLabelMatrix(:,temp)'*W'*X(:,temp);
                    end
                    temptemp=min(max(temptemp,0),Para2*(size(X,2)));
                      Weight1=[Weight1 temptemp];
              end
               Weight=Weight1;
              
              
             Weight=Weight1;
             Wtemp= W;
             %Weight=temptemp; %/sum(temptemp);
            end
                          
            
                
                 