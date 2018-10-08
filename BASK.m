clc;
clear all;
close all;
%GENERATE CARRIER SIGNAL
Tb=1; fc=10;
t=0:Tb/100:1;
c=sqrt(2/Tb)*sin(2*pi*fc*t);
%generate message signal
N=6;
m=[1 0 0 1 0 0];
disp(f1);
t1=0;t2=Tb
for i=1:N
 t=[t1:.01:t2]
 if m(i)>0.5
 m(i)=1;
 m_s=ones(1,length(t));
 else
 m(i)=0;
 m_s=zeros(1,length(t));
 end
 message(i,:)=m_s;
 %product of carrier and message
 ask_sig(i,:)=c.*m_s;
 t1=t1+(Tb+.01);
 t2=t2+(Tb+.01);
 %plot the message and ASK signal
 subplot(5,1,2);axis([0 N -2 2]);plot(t,message(i,:),'r');
 title('message signal');xlabel('t--->');ylabel('m(t)');grid on
 hold on
 subplot(5,1,4);plot(t,ask_sig(i,:));
 title('ASK signal');xlabel('t--->');ylabel('s(t)');grid on
 hold on
 end
hold off
%Plot the carrier signal and input binary data
subplot(5,1,3);plot(t,c);
title('carrier signal');xlabel('t--->');ylabel('c(t)');grid on
subplot(5,1,1);stem(m);
title('binary data bits');xlabel('n--->');ylabel('b(n)');grid on

2 
% ASK Demodulation
t1=0;t2=Tb
 for i=1:N
 t=[t1:Tb/100:t2]
 %correlator
 x=sum(c.*ask_sig(i,:));
 %decision device
 if x>0
 demod(i)=1;
 else
 demod(i)=0;
 end
 t1=t1+(Tb+.01);
 t2=t2+(Tb+.01);
 end
 %plot demodulated binary data bits
 subplot(5,1,5);stem(demod);
 title('ASK demodulated signal'); xlabel('n--->');ylabel('b(n)');grid on 