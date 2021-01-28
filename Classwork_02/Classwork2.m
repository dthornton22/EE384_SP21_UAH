%% Classwork 2 Problem 1.a
% David Thornton
% EE 384, SP 21

clf; close; clear; clc;
x = importdata('SAMPLE_ECG.mat');
t = linspace(1, 2000, length(x));
y = filter([1,1,1], 3, x);

subplot(2, 1, 1);
plot(t, x);
axis([0 2000 100 220]);
title('ECG.mat');
xlabel('n');
ylabel('x(n)');

subplot(2, 1, 2);
plot(t, y);
axis([0 2000 100 220]);
title('Classwork 2 Problem 1.a');
xlabel('n');
ylabel('y(n)');

%% Classwork 2 Problem 1.b
% David Thornton
% EE 384, SP 21

clf; close; clear; clc;
x = importdata('SAMPLE_ECG.mat');
tx = linspace(1, 2000, length(x));
% +2 is needed for increased size due to convolution
ty = linspace(1, 2000+2, length(x)+2); 
h = [1/3, 1/3, 1/3];
y = conv(x, h);

subplot(2, 1, 1);
plot(tx, x);
axis([0 2000 100 220]);
title('ECG.mat');
xlabel('n');
ylabel('x(n)');

subplot(2, 1, 2);
plot(ty, y);
axis([0 2000 100 220]);
title('Classwork 2 Problem 1.b');
xlabel('n');
ylabel('y(n)');
% This is the same result as 1.a

%% Classwork 2 Problem 1.c
% David Thornton
% EE 384, SP 21

clf; close; clear; clc;
x = importdata('SAMPLE_ECG.mat');
tx = linspace(1, 2000, length(x));
% +2 is needed for increased size due to convolution
ty = linspace(1, 2000+2, length(x)+2); 
h = [1/3, 1/3, 1/3];

n = length(x);
m = length(h);
n_y = n + m -1;
y = zeros(1,n_y);

for i = 1:n
    for k = 1:m
       y(i+k-1) = y(i+k-1) + h(k)*x(i);
    end
end

subplot(2, 1, 1);
plot(tx, x);
axis([0 2000 100 220]);
title('ECG.mat');
xlabel('n');
ylabel('x(n)');

subplot(2, 1, 2);
plot(ty, y);
axis([0 2000 100 220]);
title('Classwork 2 Problem 1.c');
xlabel('n');
ylabel('y(n)');

%% Classwork 2 Problem 2.a
% David Thornton
% EE 384, SP 21

clf; close; clear; clc;
fs = 50; % Hz
f1 = 10; % Hz
t = linspace(0,1,fs);
y1 = sin(2*pi*f1*t);

plot(t, y1);
xlabel('t');
ylabel('y1(t)');
title('Classwork 2 Problem 2.a');

%% Classwork 2 Problem 2.b
% David Thornton
% EE 384, SP 21

fs = 50; % Hz
f2 = 60; % Hz
t = linspace(0,1,fs);
y2 = sin(2*pi*f2*t);

plot(t, y2);
xlabel('t');
ylabel('y2(t)');
title('Classwork 2 Problem 2.b');

%% Classwork 2 Problem 2.c
% David Thornton
% EE 384, SP 21

clf;
subplot(2, 1, 1);
plot(t, y1);
xlabel('t');
ylabel('y1(t)');
title('Classwork 2 Problem 2.a');

subplot(2, 1, 2);
plot(t, y2);
xlabel('t'); ylabel('y2(t)');
title('Classwork 2 Problem 2.b');

figure(2);
hold on;
plot(t, y1);
plot(t, y2);
title('Classwork 2 Problem 2.c');
legend('y1','y2');
xlabel('t'); ylabel('y(t)');

% Yes, you can differentiate between y1 and y2.
% The difference is small, but y2 is slightly smoother.

%% Classwork 2 Problem 3.a
% David Thornton
% EE 384, SP 21

clf; close all; clear; clc;
f1 = 2000; % 2 kHz
fs = 50000; % 50 kHz
t = linspace(0,0.01,fs);
y1 = sin(2*pi*f1*t);
plot(t, y1);
xlabel('t');
ylabel('y(t)');
title('Classwork 2 Problem 3.a');
sound(y1, fs);
pause(1); % so sounds don't overlap

%% Classwork 2 Problem 3.b
% David Thornton
% EE 384, SP 21

clf; close; clear; clc;
f2 = 6000; % 6 kHz
fs = 50000; % 50 kHz
t = linspace(0,0.01,fs);
y2 = sin(2*pi*f2*t);
plot(t, y2);
xlabel('t');
ylabel('y(t)');
title('Classwork 2 Problem 3.b');
sound(y2, fs);
pause(1); % so sounds don't overlap

% This sound (y2) is a higher pitch than y1.

%% Classwork 2 Problem 3.c
% David Thornton
% EE 384, SP 21

clf; close; clear; clc;
f3 = 25000; % 25 kHz
fs = 50000; % 50 kHz
t = linspace(0,0.01,fs);
y3 = sin(2*pi*f3*t);
plot(t, y3);
xlabel('t');
ylabel('y(t)');
title('Classwork 2 Problem 3.c');
sound(y3, fs);

% Yes, the sound is still audible.
% This sound (y3) is a higher pitch than y2.