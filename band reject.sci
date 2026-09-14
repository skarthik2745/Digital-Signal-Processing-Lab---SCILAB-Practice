clc;
close;

N = input('enter the order ');
wc1 = input('enter the cut off frequency 1 ');
wc2 = input('enter the cut off frequency 2 ');
a = (N-1)/2;

for n = 1:N
    if (n-1 == a)
        hd(n) = 1 - (wc2 - wc1)/%pi;
    else
        hd(n) = (sin(wc1*(n-1-a)) - sin(wc2*(n-1-a)) + sin(%pi*(n-1-a))) / (%pi*(n-1-a));
    end
    
    w(n) = 0.54 - 0.46*cos((2*%pi*(n-1))/(N-1));
    h(n) = hd(n) * w(n);
end

[m, ph] = frmag(h,256);
mag = abs(m);
magdb = 20*log(mag);

subplot(1,1,1);
plot(ph/%pi, magdb);

title('band stop filter');
