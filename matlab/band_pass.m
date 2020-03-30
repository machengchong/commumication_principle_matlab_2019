function [y]=band_pass(x,fs2,fp2,fp1,fs1,Rp,Rs,fs)
%该函数采用blackman窗实现带通滤波
%x为输入信号，fs，为采样频率
%fs2,fp2分别为阻带上截至频率和通带上截至频率
%fp1，fs1分别为通带下截止频率和阻带下截至频率
%ps：输入时以上四个滤波参数按从大到小输入即可
%rp：边带区衰减DB数设置
%rs：截止区衰减DB数设置
%20150615 by boat


%求对应角频率
ws2=fs2*2*pi/fs;
wp2=fp2*2*pi/fs;
wp1=fp1*2*pi/fs;
ws1=fs1*2*pi/fs;

wp=[wp1 wp2];
ws=[ws1 ws2];




[N,Wn]=cheb1ord(wp,ws,Rp,Rs,'s');       %求切比雪夫I型滤波器阶数
fprintf('切比雪夫I型滤波器 N= %4d\n',N); %显示滤波器阶数
[bc1,ac1]=cheby1(N,Rp,Wn,'s');          %求切比雪夫I型滤波器系数，即求传输函数的分子和分母的系数向量
[Hc1,wc1]=freqs(bc1,ac1,fs);             %求切比雪夫I型滤波器频率响应
%plot(wc1/pi,20*log10(abs(Hc1)),'k');    %作图
y=filter(bc1,ac1,x);
