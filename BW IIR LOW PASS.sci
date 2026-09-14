clc;
clear all;

Fs = 2000;
Fp = 1000;
Fsamp = 9000;
ap = 2;
as = 90;

wp = (2*Fp)/Fsamp;
ws = (2*Fs)/Fsamp;

N = (log(sqrt(((10^(0.1*as))-1)/((10^(0.1*ap))-1)))/log(ws/wp));
n = ceil(N);

e = sqrt((10^(0.1*ap))-1);
l = sqrt((10^(0.1*as))-1);

omc = 0.5*((wp/(e^(1/n))) + (ws/(l^(1/n))));

hz = iir(n,'lp','butt',omc,[0 0]);

[mag,phase] = frmag(hz,256);

plot(phase,mag);
title("Butterworth IIR Low pass Filter");
xlabel("Frequency");
ylabel("Magnitude");
