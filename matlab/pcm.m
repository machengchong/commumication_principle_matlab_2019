function [y] = pcm(x)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
y=zeros(1,8);
x=1000*x;
if x>=0
    y(1)=1;
end
x=abs(x);

if (x>=128)&(x<=2048)
    y(2)=1;
end
if  ((x>=32)&(x<128))|((x>=512)&(x<=2048))
    y(3)=1;
end
if  ((x>=1024)&(x<=2048))|((x>=256)&(x<512))|((x>=64)&(x<128))|((x>=16)&(x<32))
    y(4)=1;
end

N=y(2)*4+y(3)*2+y(4)+1;

a=[0,16,32,64,128,256,512,1024];
b=[1,1,2,4,8,16,32,64];

num=floor((x-a(N))/b(N));

if(num>=8)
    y(5)=1;
end
if ((num>=12)&(num<16))|((num>=4)&(num<8))
    y(6)=1;
end
if ((num>=2)&(num<4))|((num>=6)&(num<8))|((num>=10)&(num<12))|((num>=14)&(num<16))
    y(7)=1;
end
if (num==1)|(num==3)|(num==5)|(num==7)|(num==9)|(num==11)|(num==13)|(num==15)
    y(8)=1;
end

end

