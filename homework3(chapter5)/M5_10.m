n = 0:1:255
x = zeros(1,256)
for m = 0:1:255
    x(1,m+1) = 0.1*m*exp(-0.03*m)
end
noise_fft = [zeros(1,50) 10*rand(1,156)-10 zeros(1,50)]       
noise = 5*(ifft(noise_fft,256))         %  ���������+ifft�����ض�Ƶ�ʷ�Χ������ź�
subplot(412)
plot(n,noise)
xlabel('n')
ylabel('noise')
title('��Ƶ����')
subplot(411)
plot(n,x)
xlabel('n')
ylabel('x[n]')
title('ԭ�ź�')
subplot(413)
y = noise + x
plot(n,y)
xlabel('n')
ylabel('y[n]')
title('�����������ź�')
z = fft(y,256)
for m = 50:1:206
    z(1,m) = 0          %�˲�
end
recover = ifft(z,256)
subplot(414)
plot(n,recover)
xlabel('n')
ylabel('recover')
title('��ԭ����ź�')