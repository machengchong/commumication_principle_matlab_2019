clear all;
fc=1e3;N=8;fs=2e4;
t=0:1/fs:(16*fs/fc-1)/fs;
st=randi([0,1],N,1);
%�ز��ź�
Car=cos(2*fc*pi*t);
subplot(511)
plot(t,Car);
title('�ز��ź�');
xlim([0 (16*fs/fc-1)/fs]);

%������Ԫ
 for i=1:8
     if st(i)==0
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=0;
     else
         sto((i-1)*2*fs/fc+1:i*2*fs/fc)=1;
     end
 end
 subplot(512)
 plot(t,sto);
 title('��ʼ��Ԫ');
 xlim([0 (16*fs/fc-1)/fs]);
 
 %�����ź�
 ASK=Car.*sto;
 subplot(513)
 plot(t,ASK);
 title('�����ź�');
 xlim([0 (16*fs/fc-1)/fs]);
 
 %ȫ������
 ASKout=ASK.*Car%.abs;%��ɽ��
 
 y=lowp(ASKout,1500,1700,0.1,20,fs)
%figure(1)
subplot(514);
plot(t,y);
 title('��ͨ�˲��ź�');
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
 title('�����о��ź�');
 xlim([0 (16*fs/fc-1)/fs]);
 
     