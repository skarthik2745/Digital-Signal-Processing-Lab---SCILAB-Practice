clc;
clear all;
close

x = input('Enter the sequence 1: ');
z = input('Enter the sequence 2: ');

y1 = xcorr(x, z);
y2 = xcorr(z, x);

subplot(2,2,1);
xgrid();
plot2d3(x);
ylabel('Amplitude ->');
xlabel('n ->');

subplot(2,2,2);
plot2d3(z);
ylabel('Amplitude ->');
xlabel('n ->');
title('Input sequence');

subplot(2,2,3);
xgrid();
plot2d3(y1);
title('Output sequence xz');
ylabel('amplitude');
xlabel('n ->');

subplot(2,2,4);
xgrid();
plot2d3(y2);
title('Output sequence zx');
ylabel('amplitude');
xlabel('n ->');

disp('the resultant signal xz is');
disp(y1);

disp('the resultant signal zx is');
disp(y2);
