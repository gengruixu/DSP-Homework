% Program 4_1
% Signal Smoothing by a Moving-Average Filter
%ͨ���ƶ�ƽ���˲��������ź�ƽ������
clear all 
R = 50;
d = rand(R,1)-0.5;      %����
m = 0:1:R-1;
s = 2*m.*(0.9.^m);      %�����ź�
x  = s + d';            %�������ź�
subplot(211)
plot(m,d,'r-',m,s,'b-',m,x,'g-')
xlabel('Time index n'); ylabel('Amplitude')
legend('d[n]','s[n]','x[n]');
% pause
M = 9
b = ones(M,1)/M;            %Ϊʲô/M
y = filter(b,1,x);              %��filter���������
subplot(212)
plot(m,s,'r-',m,y,'b--')
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')