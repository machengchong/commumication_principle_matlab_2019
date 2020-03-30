clear all;
t=0:2*pi/999:2*pi;
star=cos(1*t);
subplot(611)
plot(t,star);
xlim([0 2*pi]);
title('��ʼ�ź�');

   fc=1e3;N=8;fs=6e3;
   t1=0:1/fs:(400*fs/fc-1)/fs;
   
    Car=cos(2*fc*pi*t1);
    subplot(612)
    plot(t1,Car);
    title('�ز��ź�');
    xlim([0 (400*fs/fc-1)/fs]);
    
%����10����
for i=1:10
    get_num(i) = star(i*100);
end
% plot(1:10,get_num);
% xlim([0 10]);

%pcm����
for i=1:10
    get_pcm(:,i)=pcm(get_num(i));
end
   pcm_get=reshape(get_pcm,1,80);
   
   for i=1:80
        pic_pcm((i-1)*30+1:i*30)=pcm_get(i);
   end
    
   subplot(613)
   plot(t1,pic_pcm);
   title('PCM����');

  %hdb3����
  get_hdb3=hdb3(pcm_get);
   for i=1:80
        pic_hdb3((i-1)*30+1:(i-1)*30+15)=get_hdb3(i);
        pic_hdb3((i-1)*30+16:i*30)=0;
   end    
   subplot(614)
   plot(t1,pic_hdb3);
   title('HDB3����');
       
   %psk����
   PSK1=pic_hdb3.*Car;
    PSK1=awgn(PSK1,20)%��30db��˹������
   subplot(615)
   plot(t1,PSK1);
   title('PSK����Ӹ�˹������');
   
   PSK_OUT=PSK1.*Car;
   subplot(616)
   plot(t1,PSK_OUT);
   title('PSK����');
  
 y=lowp(PSK_OUT,500,700,0.1,20,fs);
figure(2)
subplot(411);
plot(t1,y);
 title('��ͨ�˲��ź�');
%  xlim([0 (16*fs/fc-1)/fs]);

for i=1:length(t1)
     if y(i)>=0.15
         y(i)=1;
     elseif  y(i)<-0.15
         y(i)=-1;
     else
         y(i)=0;
     end
end
  subplot(412);
plot(t1,y);
 title('�����о��ź�');
 
 %�ָ�hdb3��
 for i=1:80
      de_hdb3(i)=y(16+30*(i-1));
 end
 
 %�ָ�pcm��
 de_pcm=dehdb3(de_hdb3);
 for i=1:80
        pic_pcm((i-1)*30+1:i*30)=de_pcm(i);
  end
    
   subplot(413)
   plot(t1,pic_pcm);
   title('�ָ�PCM����');
   
   %�ָ�ģ���ź�
   for i=1:10
   all_out(i)=depcm( de_pcm((i-1)*8+1:(i-1)*8+8) );
   end

   t=0:2*pi/9:2*pi
   subplot(414)
   plot(t,all_out);
   title('�ָ�ģ�����');
   xlim([0 2*pi]);