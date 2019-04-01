function out = darktest(filename)
w0=0.65;   %0.65  乘积因子用来保留一些雾，1时完全去雾    
t0=0.1;
I=filename;
[h,w,s]=size(I);
min_I=zeros(h,w);           
 
%下面取得暗影通道图像
for i=1:h                 
    for j=1:w
        dark_I(i,j)=min(I(i,j,:));
    end
end
 
Max_dark_channel=double(max(max(dark_I)))  %天空亮度
dark_channel=double(dark_I);
t=1-w0*(dark_channel/Max_dark_channel);   %取得透谢分布率图

t=max(t,t0);
 
I1=double(I);
J(:,:,1) = uint8((I1(:,:,1) - (1-t)*Max_dark_channel)./t);
 
J(:,:,2) = uint8((I1(:,:,2) - (1-t)*Max_dark_channel)./t);
 
J(:,:,3) =uint8((I1(:,:,3) - (1-t)*Max_dark_channel)./t);
out = J;
end