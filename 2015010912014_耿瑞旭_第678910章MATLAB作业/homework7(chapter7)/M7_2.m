b = input('num = ');
a = input('den = ');
[H,w] = freqz(b,a,100);
magH = abs(H);
subplot(121)
plot(w/pi,magH);
xlabel('Ƶ��(w/pi)')
ylabel('����')
subplot(122)
plot(w/pi,angle(H));
xlabel('Ƶ��(w/pi)')
ylabel('��λ')