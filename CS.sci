clc; clear; close;

// Time vector
t = 0:1e-5:0.01;

// Original signal
x = 2*cos(1000*%pi*t) + 4*cos(5000*%pi*t) + 6*cos(9000*%pi*t);

// Sampling (good)
fs1 = 20000;
n1 = 0:1/fs1:0.01;
xs1 = 2*cos(1000*%pi*n1) + 4*cos(5000*%pi*n1) + 6*cos(9000*%pi*n1);

// Sampling (aliasing)
fs2 = 4000;
n2 = 0:1/fs2:0.01;
xs2 = 2*cos(1000*%pi*n2) + 4*cos(5000*%pi*n2) + 6*cos(9000*%pi*n2);


// Quantization
L = 32;
xmin = min(x);
xmax = max(x);
delta = (xmax-xmin)/L;

xq = round(x/delta)*delta;
noise = x - xq;

// PAM
pam = xs1;

// PWM
pwm = zeros(xs1);
for i=1:length(xs1)
    if xs1(i)>0 then pwm(i)=1; else pwm(i)=0; end
end

// PPM (approx)
ppm = abs(diff(pwm));
// PCM
xn = (x - min(x))/(max(x)-min(x));
pcm = round(xn*255);

// DPCM
dpcm = zeros(x);
dpcm(1)=x(1);
for i=2:length(x)
    dpcm(i)=x(i)-x(i-1);
end

// DM
dm = zeros(x);
step = 0.1;
for i=2:length(x)
    if x(i)>x(i-1) then
        dm(i)=dm(i-1)+step;
    else
        dm(i)=dm(i-1)-step;
    end
end

// ADM
adm = zeros(x);
step = 0.05;
for i=2:length(x)
    if abs(x(i)-x(i-1))>0.5 then step=step*1.5; else step=step*0.9; end
    if x(i)>x(i-1) then
        adm(i)=adm(i-1)+step;
    else
        adm(i)=adm(i-1)-step;
    end
end

mu = 255;
comp = sign(x).*log(1+mu*abs(x))/log(1+mu);
expd = sign(comp).*((1+mu).^abs(comp)-1)/mu;
encoded = dpcm; // optimized


error_dm = abs(x - dm);
error_adm = abs(x - adm);
xr = interp1(n1,xs1,t,"linear");
snr_pcm = 10*log10(sum(x.^2)/sum((x-pcm).^2));
snr_dpcm = 10*log10(sum(x.^2)/sum((x-dpcm).^2));
snr_adm = 10*log10(sum(x.^2)/sum((x-adm).^2));

disp("SNR PCM = " + string(snr_pcm));
disp("SNR DPCM = " + string(snr_dpcm));
disp("SNR ADM = " + string(snr_adm));
