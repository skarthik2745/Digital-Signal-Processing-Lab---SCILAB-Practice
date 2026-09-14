clc
clear
close
t=-5:5
[r,c]=size(t)
delta=[zeros(1,(c-1)/2),ones(1,1),zeros(1,(c-1)/2)]
subplot(421)
plot(t,delta)
xlabel('Time (s)')
ylabel('Amplitude')
title('Impulse Signal')


A=2
t1=0:0.01:10
[r1,c1]=size(t1)
u=A*ones(1,c1)
subplot(422)
plot(t1,u)
xlabel('Time (s)')
ylabel('Amplitude')
title('Step Signal')


A=2
t2=0:0.01:10
r=A*t2
subplot(423)
plot(t2,r)
xlabel('Time (s)')
ylabel('Amplitude')
title('Ramp Signal')


aA=3
t3=0:0.01:20
p=(aA*t3.^2)/2
subplot(424)
plot(t3,p)
xlabel('Time (s)')
ylabel('Amplitude')
title('Parabolic Signal')


t4=0:0.01:1
f=2
s=A*sin(2*%pi*f*t4)
subplot(425)
plot(t4,s)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sinusoidal Signal')


t5=0:0.01:1
f1=3
coss=A*cos(2*%pi*f1*t5)
subplot(426)
plot(t5,coss)
xlabel('Time (s)')
ylabel('Amplitude')
title('Cosinusoidal Signal')


t6=0:0.01:1
A2=2
b=2
ex=A2*%e^(b*t6)
subplot(427)
plot(t6,ex)
xlabel('Time (s)')
ylabel('Amplitude')
title('Exponential Signal')












