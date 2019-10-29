clear;
 %String1= strvcat('iris','wine','Isonosphere','heart','sona','glass','vehicle','australian', 'breast', 'Diabetes');
 String1= strvcat('UUUiris','UUUwine','UUUIsonosphere','UUUheart','UUUsona','UUUglass','UUUvehicle','UUUaustralian', 'UUUbreast', 'UUUDiabetes');
%String1= strvcat('readdata1','readdata2','readdata3', 'readdata4', 'readdata5')
vv=cellstr(String1);
for s=1:10
    fff=char(vv(s,1));
    load (char(fff))
   
  
     a11=[]
     a22=[];
 for i=1:5
       a11=[a11;a1{1,i}]
       a22=[a22;a2{1,i}]
     
 end
     
    
      liangC(s,1)=mean(a11(:));
      liangSd(s,1)=std(a11(:));
       
     
      liangC(s,2)=mean(a22(:));
      liangSd(s,2)=std(a22(:));
      
    
       
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
       
        
       liangC(s,k+2)=mean(temp(:));
      liangSd(s,k+2)=std(temp(:));
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
         
            liangC(s,k+6)=mean(temp(:));
            liangSd(s,k+6)=std(temp(:));
        end
       
         for k=1:4
            
       
         sum0=[] ;   
       for i=1:5
           
                 
       
            d=c1{1,i};
           
            sum0=[sum0;d{1,k}];
                     
         end
       temp=(sum0);
   
     
       
      liangC(s,k+10)=mean(temp(:));
      liangSd(s,k+10)=std(temp(:));
        end
         for k=1:4
            
       
         sum0=[]    
       for i=1:5
           
                 
       
            d=c2{1,i};
           
            sum0=[sum0;d{1,k}];
                     
         end
       temp=(sum0);
   
     
         
            liangC(s,k+14)=mean(temp(:));
      liangSd(s,k+14)=std(temp(:));
        end
        
       
end             
       
               
   