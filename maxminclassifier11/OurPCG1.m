%clear;
%load YaleB_32x32
function [Weight,ob]=OurPCG1(K,B,iter, InitalWeight, P)
%zz=rand(10,10);
    %  K=zz'*zz+(1e-3)*eye(10,10);
      %B=rand(10,5);
    % iter=20;
     % InitalWeight=B;
     % P=pinv(K+0.5);
        r=-(B-K*InitalWeight);
         z=P*r;
         p1=-r;
    
        w=InitalWeight;
        for i=1:iter
           
             a=trace(r'*z)/(trace(p1'*K*p1)+1e-10)
           
            temp=r;
            temp1=z;
            w=w+a*p1; 
            Weight=w; 
            r=r+a*K*p1;
            
           z=P*r;
           b=trace(r'*z)/(trace(temp'*temp1)+1e-10)
            p1=-z+b*p1;
           
         
           
          ob(1,i)=norm(r(:));
            if norm(r(:))<1e-15
                Weight=w;
                break;
            end
           % z=P*r;
          
        end