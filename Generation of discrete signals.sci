// Generation of Signals (Discrete)

// -----------------------------
// Unit Impulse Sequence
// -----------------------------
n = -2:1:2;
del_discrete = [zeros(1,2), ones(1,1), zeros(1,2)];

figure;
subplot(231);
plot2d3(n, del_discrete);
xlabel('Time (s)');
ylabel('Amplitude');
title('Unit Impulse Sequence');


// -----------------------------
// Unit Step Sequence
// -----------------------------
n1 = 0:1:5;
N = length(n1);
Unit_Step = ones(1, N);

subplot(232);
plot2d3(n1, Unit_Step);
xlabel('Discrete Time n');
ylabel('Amplitude');
title('Unit Step Sequence');


// -----------------------------
// Unit Ramp Sequence
// -----------------------------
n2 = 0:1:10;
Unit_ramp = n2;

subplot(233);
plot2d3(n2, Unit_ramp);
xlabel('Discrete Time n');
ylabel('Amplitude');
title('Unit Ramp Sequence');


// -----------------------------
// Exponential Sequence
// -----------------------------
a = 0.6;
n3 = 0:0.5:10;
Exp_seq = a.^n3;

subplot(234);
plot2d3(n3, Exp_seq);
xlabel('Discrete Time n');
ylabel('Amplitude');
title('Exponential Sequence');


// -----------------------------
// Sinusoidal Sequence
// -----------------------------
n4 = -1:0.1:1;
A = 2;
f2 = 1;

Sin_Dis = A * sin(2 * %pi * f2 * n4);

subplot(235);
plot2d3(n4, Sin_Dis);
xlabel('Discrete Time n');
ylabel('Amplitude');
title('Discrete Time Sinusoidal Sequence');


// -----------------------------
// Cosinusoidal Sequence
// -----------------------------
n5 = -1:0.1:1;
A = 2;
f2 = 1;

Cos_Dis = A * cos(2 * %pi * f2 * n5);

subplot(236);
plot2d3(n5, Cos_Dis);
xlabel('Discrete Time n');
ylabel('Amplitude');
title('Discrete Time Cosinusoidal Sequence');
