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
B=Bmax*sin(2*pi*200*t-pi/2);
C=Cmax*sin(2*pi*400*t+pi);
D=A+B+C;
%auf +/- 1 skalieren
D=D/max(abs(D));
plot(t,D,t,A,t,B,t,C);  axis([0 0.02 -2 2]); xlabel('t [s]'); ylabel('Amplitude');
audiowrite('Sinusgemisch.wav',D,16000);

%-------------fft-----------------

%Framelängen
L1= fa*(50/1000);
L2= fa*(100/1000);
L3= fa*(500/1000);
L4= fa*1;
L5= fa*5;

%Frequenzauflösung delta f
%Framelänge 50ms
fd1= fa/L1;
f1= [0:fd1:fa-fd1];
x1= fft(D,L1);
plot(f1,abs(x1)), title('fft 50ms'), xlabel('f[Hz]'), ylabel('Amplitude');

%Framelänge 100ms
fd2= fa/L2;
f2= [0:fd2:fa-fd2];
x2= fft(D,L2);
plot(f2,abs(x2)), title('fft 100ms'), xlabel('f[Hz]'), ylabel('Amplitude');

%Framelänge 500ms
fd3= fa/L3;
f3= [0:fd3:fa-fd3];
x3= fft(D,L3);
plot(f3,abs(x3)), title('fft 500ms'), xlabel('f[Hz]'), ylabel('Amplitude');

%Framelänge 1s
fd4= fa/L4;
f4= [0:fd4:fa-fd4];
x4= fft(D,L4);
plot(f4,abs(x4)), title('fft 1s'), xlabel('f[Hz]'), ylabel('Amplitude');

%Framelänge 5s
fd5= fa/L5;
f5= [0:fd5:fa-fd5];
x5= fft(D,L5);
plot(f5,abs(x5)), title('fft 5s'), xlabel('f[Hz]'), ylabel('Amplitude');

%--------------------Vokal 'a'------------------

[y,fs]= audioread('VokalA.wav');

%Vokal a mit Framelänge 50ms
a1= fft(y,L1);
plot(f1, abs(a1)), title('fft Vokal a 50ms'), xlabel('f[Hz]'), ylabel('Amlitude');

%Vokal a mit Framelänge 100ms
a2= fft(y, L2);
plot(f2, abs(a2)), title('fft Vokal a 100ms'), xlabel('f[Hz]'), ylabel('Amlitude');

%Vokal a mit Framelänge 500ms
a3= fft(y, L3);
plot(f3, abs(a3)), title('fft Vokal a 500ms'), xlabel('f[Hz]'), ylabel('Amlitude');

%Vokal a mit Framelänge 1s
a4= fft(y, L4);
plot(f4, abs(a4)), title('fft Vokal a 1s'), xlabel('f[Hz]'), ylabel('Amlitude');

%----------------------Vokal 'i'---------------------

[y,fs]= audioread('VokalI.wav');

%Vokal i mit Framelänge 50ms
i1= fft(y,L1);
plot(f1, abs(i1)), title('fft Vokal i 50ms'), xlabel('f[Hz]'), ylabel('Amlitude');

%Vokal i mit Framelänge 100ms
i2= fft(y, L2);
plot(f2, abs(i2)), title('fft Vokal i 100ms'), xlabel('f[Hz]'), ylabel('Amlitude');

%Vokal i mit Framelänge 500ms
i3= fft(y, L3);
plot(f3, abs(i3)), title('fft Vokal i 500ms'), xlabel('f[Hz]'), ylabel('Amlitude');

%Vokal i mit Framelänge 1s
i4= fft(y, L4);
plot(f4, abs(i4)), title('fft Vokal i 1s'), xlabel('f[Hz]'), ylabel('Amlitude');
