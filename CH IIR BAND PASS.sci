//Chebyshev Type II IIR Band Pass Filter
clc;
clear all;
close
Fs = 2000;
Fp = 1000;
Fsamp = 9000;
ap = 2;
as = 60;

wp = (2*Fp)/Fsamp;
ws = (2*Fs)/Fsamp;

N = acosh(sqrt((10^(0.1*as)-1)/(10^(0.1*ap)-1))) / acosh(ws/wp);
n = ceil(N);

hz = iir(n,'bp','cheb2',[wp ws],[0 0.3]);

[mag phase] = frmag(hz,256);

plot(phase,mag);
title('Chebyshev IIR BAND PASS Filter');
xlabel('Frequency');
ylabel('Magnitude');
