function [X,y]=correctLabel(X1,y1,extend)
      X=[];
      y=[];
      if extend==0
     for i=1:max(y1)
        dd= find(y1==i);
        X=[X X1(:,dd')];
        y=[y;y1(dd,1)];
     end
      else
          temp=1;
      for i=1:max(y1)
          
        dd= find(y1==i);
        X2=X1(:,dd');
        IDX = kmeans(X2',2)
          Index1=find(IDX==1);
          Index2=find(IDX==2);
           X=[X X2(:,Index1') X2(:,Index2')]
           y=[y;ones(size(Index1,1),1)*temp; ones(size(Index2,1),1)*(temp+1)];
        temp=temp+2;
        %X=[X X1(:,dd')];
       % y=[y;y1(dd,1)];
      end
      end
         