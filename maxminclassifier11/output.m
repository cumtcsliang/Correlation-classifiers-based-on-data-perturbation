function [a1,a2,b1,b2,c1,c2]=output(trainsample,testsample,trainlabel,testlabel,FN)

iter = 100;
%PCA方法
 %a1 = PCA(trainsample,testsample,trainlabel,testlabel,FN-1);
 %a2=LPPprojection(trainsample,testsample,trainlabel,testlabel,FN)
 %a = (a1);
 Par=[0.01 0.1 1 10 100]
 qq = [0.5 10000 3 2];
pp = [0.5 1 1.5 2];

    for j=1:4
      
        for i=1:5 
            bb2 = NonGredyOurLpDCA(trainsample,testsample,trainlabel,testlabel,FN,qq(1,j),iter,0.1,0.1,Par(1,i),trainlabel);
bb1 = OurLpDCA(trainsample,testsample,trainlabel,testlabel,FN,qq(1,j),iter,0.1,0.1,Par(1,i),trainlabel);

b1{i,j}=bb1;
b2{i,j}=bb2;
        end
        %for ss = 1:10
    %论文中的方法
 cc1 = LpPCA(trainsample,testsample,trainlabel,testlabel,FN,pp(1,j),iter);%Greed
   
    %我们的方法
   % tic
   % c1 = PCALpandPCAL1(trainsample,testsample,trainlabel,testlabel,FN,pp(1,ss),iter);
   % toc
   % c(ss,:) = (c1);
%end
cc2 = GreedyLpPCA(trainsample,testsample,trainlabel,testlabel,FN,pp(1,j),iter)  %/normGreem
 
c1{1,j}=cc1;
c2{1,j}=cc2;
    end
 
 