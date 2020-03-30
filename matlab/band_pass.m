function [y]=band_pass(x,fs2,fp2,fp1,fs1,Rp,Rs,fs)
%�ú�������blackman��ʵ�ִ�ͨ�˲�
%xΪ�����źţ�fs��Ϊ����Ƶ��
%fs2,fp2�ֱ�Ϊ����Ͻ���Ƶ�ʺ�ͨ���Ͻ���Ƶ��
%fp1��fs1�ֱ�Ϊͨ���½�ֹƵ�ʺ�����½���Ƶ��
%ps������ʱ�����ĸ��˲��������Ӵ�С���뼴��
%rp���ߴ���˥��DB������
%rs����ֹ��˥��DB������
%20150615 by boat


%���Ӧ��Ƶ��
ws2=fs2*2*pi/fs;
wp2=fp2*2*pi/fs;
wp1=fp1*2*pi/fs;
ws1=fs1*2*pi/fs;

wp=[wp1 wp2];
ws=[ws1 ws2];




[N,Wn]=cheb1ord(wp,ws,Rp,Rs,'s');       %���б�ѩ��I���˲�������
fprintf('�б�ѩ��I���˲��� N= %4d\n',N); %��ʾ�˲�������
[bc1,ac1]=cheby1(N,Rp,Wn,'s');          %���б�ѩ��I���˲���ϵ���������亯���ķ��Ӻͷ�ĸ��ϵ������
[Hc1,wc1]=freqs(bc1,ac1,fs);             %���б�ѩ��I���˲���Ƶ����Ӧ
%plot(wc1/pi,20*log10(abs(Hc1)),'k');    %��ͼ
y=filter(bc1,ac1,x);
