function [W2,ww,Weight2,ob]=maxminCorraltion(X,y,Para1,Para2, LabelMatrix,y1,Max_iter)
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
            InitalWeight=[InitalWeight ones(1,size(dd,1))/size(dd,1)];
                
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
            for iter=1:Max_iter
            
          
                
           %updatae projection vectors weight)
            W=zeros(size(X,1),size(LabelMatrix,1));
            w1=zeros(size(LabelMatrix,1),1);
            for j=1:size(X,2)
                W=W+Weight(1,j)*X(:,j)*ExtendLabelMatrix(:,j)';
              w1=w1+Weight(1,j)*ExtendLabelMatrix(:,j)/Para3;
            end
               W=W/Para1;
               r=Weight';
               ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+(r'*(ExtendLabelMatrix'*ExtendLabelMatrix)*r)/2/Para3+Para2* sum(Weight.*log(Weight./(InitalWeight)+1e-20)) ;
               ob(iter,1)=(r'*(K.*K1)*r)/(2*Para1)+Para2* sum(Weight.*log(Weight./(InitalWeight))) ;
               
               if iter==1
                     Weight2=Weight;
                       W2=W;
                       Ob1=ob(iter,1);
                      ww=w1;
               end
               if iter>1
                 %  if ob(iter,1)<=Ob1
                       Weight2=Weight;
                       W2=W;
                       ww=w1;
                       Ob1=ob(iter,1);
                     
                  %end
               end
         
              Weight1=[];
              temp=0;
              for ss=1:max(y)
                    dd=find(y==ss);
                    temptemp=[];
                    ff=[];
                     for tt=1:max(size(dd,1))
                          temp=temp+1;
                         % temptemp(1,tt)=y1(1,temp)*exp(-ExtendLabelMatrix(:,temp)'*W'*X(:,temp)/(size(X,2)*Para2));
                          temptemp(1,tt)=ExtendLabelMatrix(:,temp)'*(W'*X(:,temp)+w1)/(Para2);
                          ff(1,tt)=y1(1,temp);
                     end
                    temptemp1=exp(-temptemp);
                    if sum(temptemp1)==0
                       [dd1,index]= find(temptemp==min(temptemp));
                       temptemp=zeros(1,size(dd,1));
                       temptemp(1,index)=1;
                    elseif sum(temptemp1)==Inf
                         [dd1,index]=find(temptemp1==Inf);
                       temptemp=zeros(1,size(dd,1));
                       temptemp(1,index)=1;
                    else
                    temptemp=temptemp1;
                    end
                    temptemp= ff.*temptemp/sum(ff.*temptemp);
                      Weight1=[Weight1 temptemp];
              end
             
              
              
             Weight=Weight1;
            % Wtemp= W;
             %Weight=temptemp; %/sum(temptemp);
            end
                
                 