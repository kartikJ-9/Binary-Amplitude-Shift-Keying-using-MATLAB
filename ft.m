N=8;
m=rand(1,N);
fc=10; 
w=1/fc;
 j=sqrt(-1);
 k=1;
 for i=1:length(m)
     s(i)=m(i)*exp((-j-w-k));
 end
 
 disp(s);
 for i=1:length(s)
     plot(t,s(i))
 end