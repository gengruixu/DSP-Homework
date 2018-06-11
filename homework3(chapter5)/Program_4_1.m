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
M = input('Number of input samples = ');
b = ones(M,1)/M;            %Ϊʲô/M
y = conv_save(x,b);              %��filter���������
y(length(y)-1,:) = []
y(length(y),:) = []
subplot(212)
plot(s,'r-')
hold on
plot(y)
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')