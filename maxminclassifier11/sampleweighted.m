function P=sampleweighted(x)
tao=100;%sample weighted�����
D=size(x,1);%���������е�D,����
N=size(x,2);%���������е�N������
W=zeros(N,N);
for i=1:N;%�����ԣ���W�ĳ�ʼ��ͨ��
    for j=1:N
    %W(i,j)=exp(-(norm(x(:,i)-x(:,j)))^2/tao);
    W1(i,j)=(norm(x(:,i)-x(:,j)))^2;
    
    
    
    end
end;
tao=mean(W1(:));


for i=1:N;%�����ԣ���W�ĳ�ʼ��ͨ��
    for j=1:N
    W(i,j)=exp(-(norm(x(:,i)-x(:,j)))^2/tao);
    %W1(i,j)=(norm(x(:,i)-x(:,j)))^2;
    
    
    
    end
end
     DD=sum(W);
P=DD/sum(DD);
%tao�����������Ե�ƽ��ֵ  ������������
    
