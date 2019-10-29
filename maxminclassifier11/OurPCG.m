%

%sA = (sum(A.^2, 2)); 
%sB = (sum(B.^2, 2)); 
%K2 = exp(bsxfun(@minus,bsxfun(@minus,2*A*B', sA), sB')/beta);

%clear;
%load YaleB_32x32
function [Weight,ob]=OurPCG(K,B,iter, InitalWeight, P)
%zz=rand(10,10);
     % K=zz'*zz+(1e-3)*eye(10,10);
     % B=rand(10,5);
     % iter=7;
     % InitalWeight=B;
     % P=pinv(K+0.5);
        r=B-K*InitalWeight;
        
    
        w=InitalWeight;
        for i=1:iter
            z=P*r;
            if i==1 
              p1=z;
            else
            b=trace(r'*z)/trace(temp'*temp1);
            p1=z+b*p1;
            end
            a=trace(r'*z)/trace(p1'*K*p1);
            w=w+a*p1;
            Weight=w;
            temp=r;
            temp1=z;
            r=r-a*K*p1;
            ob(1,i)=norm(r(:));
            if norm(r(:))<1e-5
                Weight=w;
                break;
            end
           % z=P*r;
          
        end
            