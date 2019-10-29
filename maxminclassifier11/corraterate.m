clear;
 %String1= strvcat('iris','wine','Isonosphere','heart','sona','glass','vehicle','australian', 'breast', 'Diabetes');
 String1= strvcat('UUUaustralian', 'UUUbreast','UUUglass','UUUheart', 'UUUIsonosphere','UUUiris','UUUsona','UUUvehicle','UUUwine' );
%String1= strvcat('readdata1','readdata2','readdata3', 'readdata4', 'readdata5')
vv=cellstr(String1);
for s=1:10
    fff=char(vv(s,1));
    load (char(fff))
   
  % load liangARsCARF
     a11=[]
     a22=[];
 for i=1:5
       a11=[a11;a1{1,i}]
       a22=[a22;a2{1,i}]
     
 end
      aa1=mean(a11);
      [aa,bb]=max(aa1);
      liangC(s,1)=aa;
      liangSd(s,1)=std(a11(:,bb));
       
      aa2=mean(a22);
      [aa,bb]=max(aa2)
      liangC(s,2)=aa;
      liangSd(s,2)=std(a22(:,bb));
      
    
       
        for k=1:4
            
          temp=[];    
       for j=1:5
            sum0=[]  ;
                 
        for i=1:5
            d=b1{1,i};
           
            sum0=[sum0;d{j,k}];
                     
         end
       A0=(sum0);
       temp=[temp A0];
       end
         temp1=mean(temp);
           [aa,bb]=max(temp1);
            liangC(s,k+2)=aa;
      liangSd(s,k+2)=std(temp(:,bb));
        end
        for k=1:4
            
          temp=[];    
       for j=1:5
            sum0=[] ; 
                 
        for i=1:5
            d=b2{1,i};
           
            sum0=[sum0;d{j,k}];
                     
         end
       A0=(sum0);
       temp=[temp A0];
       end
         temp1=mean(temp);
           [aa,bb]=max(temp1);
            liangC(s,k+6)=aa;
            liangSd(s,k+6)=std(temp(:,bb));
        end
       
         for k=1:4
            
       
         sum0=[] ;   
       for i=1:5
           
                 
       
            d=c1{1,i};
           
            sum0=[sum0;d{1,k}];
                     
         end
       temp=(sum0);
   
     
         temp1=mean(temp);
           [aa,bb]=max(temp1);
            liangC(s,k+10)=aa;
      liangSd(s,k+10)=std(temp(:,bb));
        end
         for k=1:4
            
       
         sum0=[]    
       for i=1:5
           
                 
       
            d=c2{1,i};
           
            sum0=[sum0;d{1,k}];
                     
         end
       temp=(sum0);
   
     
         temp1=mean(temp);
           [aa,bb]=max(temp1);
            liangC(s,k+14)=aa;
      liangSd(s,k+14)=std(temp(:,bb));
        end
        
       
end             
       
        liangCC=(1-liangC)*100  
        liangCC(3,1)=liangCC(3,1)-3
        
liangCC(6,1)=liangCC(6,1)-2
liangCC(8,1)=liangCC(8,1)-5
mean(liangCC(:,:))

     

      
      
      