%Abtastfrequenz 16000 Hz
fa=16000;
Ta=1/fa;
t=[0:Ta:5-Ta]; %Zeitachse 5 Sekunden
Amax=1.0; %Spitzenamplitude
Bmax=0.5;
Cmax=0.5;
%max. Signalfrequenz !<5000 Hz
%Frequenz 100Hz
A=Amax*sin(2*pi*100*t);
B=Bmax*sin(2*pi*200*t+pi/2);
C=Cmax*sin(2*pi*400*t+pi);
D=A+B+C;
D=log(D);
%auf +/- 1 skalieren
D=D./max(abs(D));
plot(t,D,t,A,t,B,t,C);  axis([0 0.02 -2 2]); xlabel('t [s]'); ylabel('Amplitude');
audiowrite('Uebungs1.wav',D,fa,16);


