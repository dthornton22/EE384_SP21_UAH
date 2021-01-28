%% Classwork 1 Problem 2.2
% David Thornton
% EE 384, SP 21
x = @(n) ((2 * n) + 3); % given
n = -10:10; % given
% 2.2 a)
hold on;
xlabel('n');
ylabel('x(n)');
title('Classwork 1 Problem 2.2');
stem(n, x(n));
% 2.2 b)
x_d = time_shift(x, n, 3);
stem(n, x_d);
% 2.2 c) 
stem(n, x(-n));
legend('2.2a', '2.2b', '2.2c');

%% Classwork 1 Problem 2.3
% David Thornton
% EE 384, SP 21
clf;
y1 = (5 * unit_impulse(-4, -10, 10) - (2 * unit_impulse(2, -10, 10))); % given
stem(n, y1);
xlabel('n');
ylabel('y(n)');
title('Classwork 1 Problem 2.3');

%% Classwork 1 Problem 2.4
% David Thornton
% EE 384, SP 21
clf;
z = unit_step(0, -10, 10) - unit_step(4, -10, 10); % given
stem(n, z);
xlabel('n');
ylabel('z(n)');
title('Classwork 1 Problem 2.4');

%% Classwork 1 Problem 3.1
% David Thornton
% EE 384, SP 21
clf; close; clear; clc;
x = importdata('SAMPLE_ECG.mat');

%% Classwork 1 Problem 3.2
% David Thornton
% EE 384, SP 21
t = linspace(1, 2000, length(x));
y = zeros(1, length(x));

for n = 1:length(t)-2 % make y(n)
    y(n) = (x(n) + x(n+1) + x(n+2)) / 3;
end

%% Classwork 1 Problem 3.3
% David Thornton
% EE 384, SP 21
subplot(2, 1, 1)
plot(t, x)
axis([0 2000 100 220])
title('x(n)')

subplot(2, 1, 2)
plot(t, y)
axis([0 2000 100 220])
title('y(n)')

%% Classwork 1 Problem 3.4
% David Thornton
% EE 384, SP 21

% Yes, y(n) is smoother than x(n).
