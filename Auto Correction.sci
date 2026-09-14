// Auto Correlation

clc;
clear;
close;

// Input sequence
x = input('Enter the sequence 1: ');

// Auto correlation using convolution
y = xcorr(x, x);

// ---- Plotting ----
subplot(2,1,1);
plot2d3(1:length(x), x);
xlabel('n -->');
ylabel('Amplitude -->');
title('Input sequence');

subplot(2,1,2);
plot2d3(1:length(y), y);
xlabel('n -->');
ylabel('Amplitude -->');
title('Output sequence');

// Display result
disp('The resultant is:');
disp(y);
