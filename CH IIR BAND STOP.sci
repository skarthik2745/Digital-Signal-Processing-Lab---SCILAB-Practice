//Chebyshev Type I IIR Band Stop Filter
clc;
clear all;
close
Fs = 2000;
Fp = 1000;
Fsamp = 9000;
ap = 2;
as = 90;

wp = (2*Fp)/Fsamp;
ws = (2*Fs)/Fsamp;

N = acosh(sqrt((10^(0.1*as)-1)/(10^(0.1*ap)-1))) / acosh(ws/wp);
n = ceil(N);

hz = iir(n,'sb','cheb1',[wp ws],[0.5 1]);

[mag phase] = frmag(hz,256);

plot(phase,mag);
title('Chebyshev IIR Band Stop Filter');
xlabel('Frequency');
ylabel('Magnitude');
