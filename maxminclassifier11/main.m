clear

String1= strvcat('heart');
%String1= strvcat('readdata1','readdata2','readdata3', 'readdata4', 'readdata5')
vv=cellstr(String1);
for pp=1:1
    fff=char(vv(pp,1));
    load (char(fff))
   
   % load YaleB_32x32
    
%SampleLabel=gnd;
%Sample=fea';
[m1,n1]=size(SampleLabel);

%这个地方总是报错，而且，我查了下，crossval函数无法这样用
[itrn,itst]=crossval(m1,5);
%Z1 = zscore(Sample');
%Sample=Z1';
[mn,n1]=size(Sample);
  av=mean(Sample')';
%Sample=[Sample;ones(1,size(Sample,2))];
 for u=1:n1
    Sample(:,u)=Sample(:,u)-av;
 Sample(:,u)=Sample(:,u)/norm(Sample(:,u));
 end
   % Sample(:,i)=Sample(:,i)/norm(Sample(:,i));

 
for ss=1:5
    
yy1=itrn{1,ss};
yy2=itst{1,ss};
 
Trainset=Sample(:,yy1);
LabelTrain=SampleLabel(yy1',:);
Testset=Sample(:,yy2);
LabelTest=SampleLabel(yy2',1);
%[mm1,nn1]=size(TempTrain);

while(1)

cccc=max(SampleLabel);
LabelTemnp=100;

for ii=1:cccc
   index=find(LabelTrain==ii);
    if index==0;
        LabelTemnp=index;
    end
end
if LabelTemnp==0
    disp('fail to partition')
end
if LabelTemnp ~=0;
    break;
end 
end
  
 Max=1000;
FN=floor(mn);

  X=Trainset;
  y=LabelTrain;
  %Para0=[1e-2 1e-1 1e0 1e1 1e2];
  Para0=[ 1e0 ];
   Para00=[  1e0  ];
  extend=0;
  [X,y]=correctLabel(X,y,extend);
  if max(y)==2
       LabelMatrix=-ones(max(y),max(y));
  else
  LabelMatrix=-ones(max(y),max(y))/(max(y)-1);
  end
  for jj=1:max(y)
     LabelMatrix(jj,jj)=1;
  end

 yyy=1e0;
 

 %X=X/norm(X);
  y1=ones(1,size(X,2));
  sampleweight=sampleweighted(X);
%y1=sampleweight;
 for i=1:1
     for j=1:1
         Para1=Para0(1,i);
         Para2=Para0(1,j);
         if max(y)>2
 
[W,ww]=MulticlassimaxminCorraltion1(X,y,Para1, Para2);

liang1(1,ss)=MCorraltionClassifier(Testset,LabelTest,W,ww)

[W,ww]=MBProjectionmaxminCorraltion(X,y,Para1, Para2,y1,Max);
liang6(1,ss)=MCorraltionClassifier(Testset,LabelTest,W,ww);

         else
              [W,ww,Weight1,ob]=maxminCorraltion1(X,y,Para1, Para2,LabelMatrix,y1,Max);

liang1(1,ss)=CorraltionClassifier(Testset,LabelTest,LabelMatrix,W,ww,extend);

[W,ww]=BProjectionmaxminCorraltion(X,y,Para1, Para2,LabelMatrix,y1,Max);
liang6(1,ss)=CorraltionClassifier(Testset,LabelTest,LabelMatrix,W,ww,extend);
             
         end

     end
 end

 data.X=X;
 data.y=y';
 


   A=X';
  B=Testset';
sA = (sum(A.^2, 2)); 
sB = (sum(B.^2, 2)); 
 beta =yyy*stdv(X'); 
K2 = exp(bsxfun(@minus,bsxfun(@minus,2*A*B', sA), sB')/(2*beta));
K3 = exp(bsxfun(@minus,bsxfun(@minus,2*A*A', sA), sA')/(2*beta));


for i=1:1
     for j=1:1
         Para1=Para0(1,i);
         Para2=Para0(1,j);
         if max(y)>2
         
[LabelMatrix,Weight,W]=MKernelmaxminCorraltion1(X,y,Para1, Para2, Max,0);
 
 
 
liang3(1,ss)=MKernelCorraltionClassifier(K2,LabelTest,W,LabelMatrix,Weight,K3)

[LabelMatrix,Weight,W]=MKernelmaxminCorraltion1(X,y,Para1, Para2, Max,1);
 
 
 
liang5(1,ss)=MKernelCorraltionClassifier(K2,LabelTest,W,LabelMatrix,Weight,K3)

         else
 
 [w1,z1,W,Weight,ob]=KernelmaxminCorraltion1(X,y,Para1, Para2, LabelMatrix,y1,Max,yyy);
 
 
 
liang3(1,ss)=KernelCorraltionClassifier(w1,z1,K2,LabelTest,LabelMatrix,W,Weight,extend);

[w1,z1,W,Weight,ob]=PKernelmaxminCorraltion1(X,y,Para1, Para2, LabelMatrix,y1,Max,yyy);
 
 
 
liang5(1,ss)=KernelCorraltionClassifier(w1,z1,K2,LabelTest,LabelMatrix,W,Weight,extend);
         end
     end
end 
  
 

     


end 
   ddd=strcat('new',fff);  % 1 3 is unit matrix    0 and 2 (-1,1)
        save (ddd, 'liang1',  'liang3','liang5', 'liang6')
end