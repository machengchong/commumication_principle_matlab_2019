clear all;
fc=1e3;N=8;fs=2e4;
t=0:1/fs:(16*fs/fc-1)/fs;
st=randi([0,1],N,1);

%产生绝对码元
 for i=1:8
     if st(i)==0
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=0;
     else
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=1;
     end
 end
 subplot(711)
 plot(t,sto);
 title('绝对码元');
 xlim([0 (16*fs/fc-1)/fs]);
 
 %产生相对码元
 for i=1:8
     if i==1
         std(i)=st(i);
     else
         std(i)=st(i)+std(i-1);
         if std(i)==2
             std(i)=0;
         end
     end
 end
 for i=1:8
     if std(i)==0
         stod((i-1)*2*fs/fc+1:i*2*fs/fc)=0;
     else
         stod((i-1)*2*fs/fc+1:i*2*fs/fc)=1;
     end
 end
 subplot(712)
 plot(t,stod);
 title('相对码元');
 xlim([0 (16*fs/fc-1)/fs]);
 
 DPSK=-stod.*sin(2*fc*pi*t)+(1-stod).*sin(2*fc*pi*t);
 subplot(713)
 plot(t,DPSK);
 title('调制信号DPSK');
 xlim([0 (16*fs/fc-1)/fs]);
 
 DPSK_OUT=DPSK.*sin(2*fc*pi*t);
 subplot(714)
 plot(t,DPSK_OUT);
 title('调制信号DPSK*载波');
 xlim([0 (16*fs/fc-1)/fs]);
 
  y=lowp(DPSK_OUT,500,700,0.1,20,fs)
%figure(1)
subplot(715);
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
 
 subplot(716);
plot(t,y);
 title('抽样判决信号');
 xlim([0 (16*fs/fc-1)/fs]);
 
 %译码
 for i=1:8
     DPSK1(i)=y(40+(i-1)*40)
 end
for i=1:8
    if i==1
       DPSK2(i)=DPSK1(i);
    else
        DPSK2(i)=DPSK1(i)+DPSK1(i-1);
       if DPSK2(i)==2
             DPSK2(i)=0;
         end
    end
end
for i=1:8
     if DPSK2(i)==0
         DPSK2out((i-1)*2*fs/fc+1:i*2*fs/fc)=0;
     else
         DPSK2out((i-1)*2*fs/fc+1:i*2*fs/fc)=1;
     end
 end
subplot(717);
plot(t,DPSK2out);
 title('译码信号');
 xlim([0 (16*fs/fc-1)/fs]);