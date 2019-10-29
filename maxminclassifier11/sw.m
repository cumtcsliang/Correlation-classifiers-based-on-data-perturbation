function [XX,YY]=sw(X,Y,tao)   %若X的列数与Y的行数不等也可以运行，自动忽略了X的其他列数
group=max(Y);  %矩阵来源于group组
XX=[]; 
YY=[];
%对应输出
          %X中的第几个向量
for  j=1:group ;   %计算第j在的SX
         index=find(Y==j);
         NewX=X(:,index);
         YY=[YY;Y(index)];
  
    %*size(NewX,2)
       %newX即为选出来的相对应的矩阵
    sampleweight=sampleweighted(NewX);%一列数，count列
    DD=repmat(sampleweight,size(NewX,1),1);
    XX=[XX DD.*NewX];
   
    
end


   
        