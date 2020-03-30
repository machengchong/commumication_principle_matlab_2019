clear all;
fc1=1e3;fc2=2e3;N=8;fs=2e4;
t=0:1/fs:(16*fs/fc1-1)/fs;
st=randi([0,1],N,1);

%产生码元
 for i=1:8
     if st(i)==0
         sto((i-1)*2*fs/fc1+1:i*2*fs/fc1)=0;
     else
         sto((i-1)*2*fs/fc1+1:i*2*fs/fc1)=1;
     end
 end
 subplot(511)
 plot(t,sto);
 title('初始码元');
 xlim([0 (16*fs/fc1-1)/fs]);
 
FSK=sto.*cos(2*fc1*pi*t)+(1-sto).*cos(2*fc2*pi*t);
subplot(512)
 plot(t,FSK);
 title('调制信号FSK');
 xlim([0 (16*fs/fc1-1)/fs]);
 
 y=lowp(FSK,1500,1700,0.1,20,fs)
 y1=y.*cos(2*fc1*pi*t);
 y1=lowp(y1,500,700,0.1,20,fs)
 subplot(513);
plot(t,y1);
 title('低通滤波信号');
 xlim([0 (16*fs/fc1-1)/fs]);
 
 y=highp(FSK,1500,1600,0.1,20,fs)
 y2=y.*cos(2*fc2*pi*t);
 y2=lowp(y2,500,700,0.1,20,fs)
 subplot(514);
plot(t,y2);
 title('高通滤波信号');
 xlim([0 (16*fs/fc1-1)/fs]);
 
  
 for i=1:length(t)
     if y1(i)>=0.14
         y1(i)=1;
     else
         y1(i)=0;
     end
 end
 
 subplot(515);
plot(t,y1);
 title('抽样判决信号');
 xlim([0 (16*fs/fc1-1)/fs]);