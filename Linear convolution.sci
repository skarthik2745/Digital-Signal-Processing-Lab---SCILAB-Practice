// Linear Convolution between x(n) and h(n)

clc;
clear;
close;

// Input sequences
x = input('Enter the sequence x(n): ');
h = input('Enter the sequence h(n): ');

// Linear convolution
y = conv(x, h);

// -----------------------------
// Plotting
// -----------------------------
subplot(3,1,1);
plot2d3(x);
xlabel('Samples');
ylabel('Amplitude');
title('Input Sequence x(n)');

subplot(3,1,2);
plot2d3(h);
xlabel('Samples');
ylabel('Amplitude');
title('Input Sequence h(n)');

subplot(3,1,3);
plot2d3(y);
xgrid(5, 1, 7);
xlabel('Samples');
ylabel('Amplitude');
title('Linear Convolution of Signals');

// -----------------------------
// Displaying Results
// -----------------------------
disp('x = ', x);
disp('h = ', h);
disp('y = ', y);
