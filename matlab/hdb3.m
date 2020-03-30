function [y] = hdb3(x)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
n=length(x);
k=0;v=0;
for i=1:n
    if x(i)==1
        if k==1
            x(i)=1;
            k=0;
        elseif k==0
            x(i)=-1;
            k=1;
        end
    end
end

for i=1:n-3
    if (x(i)==0)&(x(i+1)==0)&(x(i+2)==0)&(x(i+3)==0)
        if i==1
            x(i+3)=2;
            v=1;break
        else
            if (x(i-1)==1)
                 %x(i+3)=2;
                 v=1;break
            end
            if (x(i-1)==-1)
                 %x(i+3)=-2;
                 v=0;break
            end
        end
    end
end

if v==1
    v=0;
end
if v==0
    v=1;
end

for i=1:n-3
    if (x(i)==0)&&(x(i+1)==0)&&(x(i+2)==0)&&(x(i+3)==0)
        if i==1
            x(i+3)=2;
            v=1;
        elseif  v==0
                    v=1;
                     x(i+3)=2;
                     
                             if (x(i-1)<0)
                                 x(i)=3;
                             end
        else
                    if v==1
                           v=0;
                             x(i+3)=-2;

                                  if (x(i-1)>0)
                                     x(i)=-3;
                                  end
                     end
         end
            
    end
end

     y=x;
     
     for i=1:n
         if y(i)>0
             y(i)=1;
         end
         if y(i)<0
             y(i)=-1;
         end     
     end
     
end

