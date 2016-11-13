%Abtastfrequenz 16000 Hz
fa=16000;
Ta=1/fa;
L= 5000;
t=[0:Ta:5-Ta]; %Zeitachse 5 Sekunden
Amax=1.0; %Spitzenamplitude
Bmax=0.5;
Cmax=0.5;
X= Amax*sin(2*pi*100*t) + Bmax*sin(2*pi*200*t+pi/2) + Cmax*sin(2*pi*400*t+pi);
Y= fft(X);
P2= abs(Y/L);
P1= P2(1:L/2+1);
P1(2:end-1)= 2*P1(2:end-1);
P1=log(P1);
f= fa*(0:(L/2))/L;
plot(f,P1)
title ('fft')
xlabel('f(Hz)')
ylabel('P1(f)')