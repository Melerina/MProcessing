L= 1000;
[y,fs]= audioread('VokalA.wav');
f=fs/L.*(0:L-1);
Y=fft(y,L);
Y=abs(Y(1:L))./(L/2);
Y=log(Y);
plot(f,Y);
title('Vokal a');