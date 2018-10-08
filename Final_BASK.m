%BASK Modulation

clc;
clear all;
close all;
x = input('Enter the message bits, x=');
T=input('Enter the bit duration in msec, T=');
fc=input('Enter carrier frequency in kHz, fc=');
Ac = input('Enter carrier amplitude, Ac=');
t=[];
m=[];
n=nume1(x);
for i=1:n
  temp=(i-1)*T:0.001:i*T;
  if(x(i)==1)
    x1=ones(1,nume1(temp));
  elseif (x(i)==0)
    x1=zeros(1,nume1(temp));
  end
  t=[t,temp];
  m=[m,x1];
  i=i+1;
end
c=Ac*sin(2*pi*fc*t);
y=m.*c;
subplot(311);
plot(t,m);
title('Message Signal');
ylabel('Amplitude');
axis([0 10 -2 2]);
subplot(312);
plot(t,c);
title('Carrier Signal');
ylabel('Amplitude');
axis([0 10 -2 2]);
subplot(313);
plot(t,y);
title('BASK Signal');
xlabel('Time (msec)');
ylabel('Amplitude');
axis([0 10 -2 2]);