clear

String1= strvcat('iris','wine','Isonosphere','heart','sona','glass','vehicle','australian', 'breast', 'Diabetes');
%String1= strvcat('readdata1','readdata2','readdata3', 'readdata4', 'readdata5')
vv=cellstr(String1);
for pp=1:10
   
    fff=char(vv(pp,1));
      ddd=strcat('newnew1UUU3',fff);
    load (char(ddd))
   
    ddd=strcat('UUU1',fff);
    
     A=mean(liang1,3);
     temp1(1,pp)=min(A(:));
      B=mean(liang2,2)
     temp1(2,pp)=min(B(:));
     
      A=mean(liang3,3);
     temp1(3,pp)=min(A(:));
      B=mean(liang4,2)
     temp1(4,pp)=min(B(:));
       A=mean(liang5,3);
     temp1(5,pp)=min(A(:));
      B=mean(liang6,3)
     temp1(6,pp)=min(B(:));
     
end