function y = parameterfun(r,Para1,Para2)
  
load templiang K K1 ExtendLabelMatrix Weight InitalWeight
y=(r'*(K.*K1)*r)/(2*Para1)+(r'*(ExtendLabelMatrix'*ExtendLabelMatrix)*r)/2/1+Para2* sum(Weight.*log(Weight./(InitalWeight)+1e-20)) ;