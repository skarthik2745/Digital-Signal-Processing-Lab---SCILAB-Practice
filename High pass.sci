clc;
close;

N = input('enter the order ');
wc = input('enter the cut off frequency ');
a = (N-1)/2;

for n = 1:N
    if (n-1 == a)
        hd(n) = 1 - (wc/%pi);
    else
        hd(n) = (sin(%pi*(n-1-a)) - sin(wc*(n-1-a))) / (%pi*(n-1-a));
    end
    
    w(n) = 0.42 - 0.5*cos((2*%pi*(n-1))/(N-1)) + 0.08*cos((4*%pi*(n-1))/(N-1));
    h(n) = hd(n) * w(n);
end

[m, ph] = frmag(h,256);
mag = abs(m);
magdb = 20*log10(mag);

plot(ph/%pi, magdb);
title('Highpass filter');
