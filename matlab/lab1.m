clear all;
fc=1e3;N=8;fs=2e4;
t=0:1/fs:(16*fs/fc-1)/fs;
st=randi([0,1],N,1);
%载波信号
Car=cos(2*fc*pi*t);
subplot(511)
plot(t,Car);
title('载波信号');
xlim([0 (16*fs/fc-1)/fs]);

%产生码元
 for i=1:8
     if st(i)==0
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=0;
     else
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=1;
     end
 end
 subplot(512)
 plot(t,sto);
 title('初始码元');
 xlim([0 (16*fs/fc-1)/fs]);
 
 %调制信号
 ASK=Car.*sto;
 subplot(513)
 plot(t,ASK);
 title('调制信号');
 xlim([0 (16*fs/fc-1)/fs]);
 
 %全波整流
 ASKout=ASK.*Car%.abs;%相干解调
 
 y=lowp(ASKout,1500,1700,0.1,20,fs)
%figure(1)
subplot(514);
plot(t,y);
 title('低通滤波信号');
 xlim([0 (16*fs/fc-1)/fs]);
 
 for i=1:length(t)
     if y(i)>=0.05
         y(i)=1;
     else
         y(i)=0;
     end
 end
 
 subplot(515);
plot(t,y);
 title('抽样判决信号');
 xlim([0 (16*fs/fc-1)/fs]);
 
     