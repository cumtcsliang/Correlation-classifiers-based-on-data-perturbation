function [XX,YY]=sw(X,Y,tao)   %��X��������Y����������Ҳ�������У��Զ�������X����������
group=max(Y);  %������Դ��group��
XX=[]; 
YY=[];
%��Ӧ���
          %X�еĵڼ�������
for  j=1:group ;   %�����j�ڵ�SX
         index=find(Y==j);
         NewX=X(:,index);
         YY=[YY;Y(index)];
  
    %*size(NewX,2)
       %newX��Ϊѡ���������Ӧ�ľ���
    sampleweight=sampleweighted(NewX);%һ������count��
    DD=repmat(sampleweight,size(NewX,1),1);
    XX=[XX DD.*NewX];
   
    
end


   
        