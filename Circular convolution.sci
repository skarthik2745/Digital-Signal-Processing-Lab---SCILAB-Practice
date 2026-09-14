clc;
clear;
close;

// Input sequences
x = [1 2 3 4 5];     // input('Enter the elements of x: ');
h = [1 1 1 1];       // input('Enter the elements of h: ');

// Lengths
l = length(x);
m = length(h);

// Make equal length
N = max(l, m);

if l < N then
    x = [x zeros(1, N-l)];
end

if m < N then
    h = [h zeros(1, N-m)];
end

// Initialize output
y = zeros(1, N);

// Circular Convolution
for i = 1:N
    y(i) = 0;
    for j = 1:N
        k = i - j + 1;

        if k <= 0 then
            k = k + N;
        end

        y(i) = y(i) + x(j) * h(k);
    end
end

// ---- Plotting ----
subplot(3,1,1);
plot2d3(1:N, x);
title('Circular Convolution of Signals');
xlabel('n');
ylabel('x(n)');

subplot(3,1,2);
plot2d3(1:N, h);
xlabel('n');
ylabel('h(n)');

subplot(3,1,3);
plot2d3(1:N, y);
xlabel('n');
ylabel('y(n)');
xgrid(2);

// Display Output
disp('Output sequence y(n):');
disp(y);
