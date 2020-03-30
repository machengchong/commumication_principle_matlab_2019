clear all;
fc=1e3;N=8;fs=2e4;
t=0:1/fs:(16*fs/fc-1)/fs;
st=randi([0,1],N,1);

%产生码元
 for i=1:8
     if st(i)==0
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=0;
     else
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=1;
     end
 end
 subplot(511)
 plot(t,sto);
 title('初始码元');
 xlim([0 (16*fs/fc-1)/fs]);
 
 PSK=-sto.*sin(2*fc*pi*t)+(1-sto).*sin(2*fc*pi*t);
 subplot(512)
 plot(t,PSK);
 title('调制信号PSK');
 xlim([0 (16*fs/fc-1)/fs]);
 
 PSK_OUT=PSK.*sin(2*fc*pi*t);
 subplot(513)
 plot(t,PSK_OUT);
 title('调制信号PSK*载波');
 xlim([0 (16*fs/fc-1)/fs]);
 
  y=lowp(PSK_OUT,500,700,0.1,20,fs)
%figure(1)
subplot(514);
plot(t,y);
 title('低通滤波信号');
 xlim([0 (16*fs/fc-1)/fs]);
 
 for i=1:length(t)
     if y(i)>=0
         y(i)=0;
     else
         y(i)=1;
     end
 end
 
 subplot(515);
plot(t,y);
 title('抽样判决信号');
 xlim([0 (16*fs/fc-1)/fs]);