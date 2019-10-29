function P=sampleweighted(x)
tao=100;%sample weighted里的套
D=size(x,1);%就是论文中的D,行数
N=size(x,2);%就是论文中的N，列数
W=zeros(N,N);
for i=1:N;%经测试，对W的初始化通过
    for j=1:N
    %W(i,j)=exp(-(norm(x(:,i)-x(:,j)))^2/tao);
    W1(i,j)=(norm(x(:,i)-x(:,j)))^2;
    
    
    
    end
end;
tao=mean(W1(:));


for i=1:N;%经测试，对W的初始化通过
    for j=1:N
    W(i,j)=exp(-(norm(x(:,i)-x(:,j)))^2/tao);
    %W1(i,j)=(norm(x(:,i)-x(:,j)))^2;
    
    
    
    end
end
     DD=sum(W);
P=DD/sum(DD);
%tao是所有样本对的平均值  ，矩阵列向量
    
