function [y] = dehdb3(x)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
n=length(x);
y=x;
for i=2:n-3
    if (x(i)==0)&&(x(i+1)==0)&&(x(i+2)==0)
        if (x(i-1)==x(i+3))
            y(i+3)=0;
        end
    end
end

for i=2:n-2
    if (x(i)==0)&&(x(i+1)==0)
        if (x(i-1)==x(i+2))
            y(i+2)=0;
            y(i-1)=0;
        end
    end
end

for i=1:n
    if y(i)~=0
        y(i)=1;
end
end

