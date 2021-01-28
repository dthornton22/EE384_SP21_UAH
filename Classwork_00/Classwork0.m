%% Classwork 0 Problem 1
% David Thornton
% EE 384
clear

%1.1
a = [2;5;8];
b = [3;13;8];

disp('a + b')
disp(a + b)

disp('a * b')
disp('Incorrect dimensions for matrix multiplication.'); disp(' ')
%a * b is not possible

disp('a .* b')
disp(a .* b)

%1.2
disp('******************************************')
disp('New a matrix');
disp('******************************************')
disp(' ')

a = [1,2,-3;
     2,1,2;
     4,-2,1];
 
disp('a + b')
disp(a + b)

disp('a * b')
disp(a * b)

disp('a .* b')
disp(a .* b)
%% Classwork 0 Problem 2
% David Thornton
% EE 384
clear

%2a
ta = 0:1:50;
y1 = cos(ta);
y2 = sin(ta);
figure(1); hold on; title('y = cos(t)'); xlabel('t'); ylabel('y')
plot(ta, y1, 'r--')
figure(2); hold on; title('y = sin(t)'); xlabel('t'); ylabel('y')
plot(ta, y2, 'r--')

%2b
tb = 0:0.01:50;
y1 = cos(tb);
y2 = sin(tb);
figure(1)
plot(tb, y1, 'k')
figure(2)
plot(tb, y2, 'k')

% Q: Do the signals look smoother when we reduce the increasing step?
% A: Yes. Increasing the step can be thought of similairly to increasing
% the resolution on a monitor. More steps means a better 'picture'
%% Classwork 0 Problem 3
% David Thornton
% EE 384
clear

a = [2, 1, 2];
b = [3, 3, 2];
c = [1, -1, 0];
d = [3, 6, 7];

%a = input('Please enter the coefficients of x: \n');
%b = input('Please enter the coefficients of y: \n');
%c = input('Please enter the coefficients of z: \n');
%d = input('Please enter the constant: \n');

A = [a(1) b(1) c(1);
     a(2) b(2) c(2);
     a(3) b(3) c(3)];
 
B = [d(1) d(2) d(3)]';

t = inv(A) * B
%% Classwork 0 Problem 4
% David Thornton
% EE 384
clear

%u = input('Please enter the u value: ');
u = 255;
%x = input('Please enter the x value/vector: ');
x = 0:0.01:1;
y = PCM(u, x);

function y = PCM(u, x)
    for i = 1:length(x)
        y(i) = log(1+(u*abs(x(i)))) / log(1+u) * sign(x(i));
    end
    figure(3)
    plot(x, y)
    title('Pulse-code modulation')
    xlabel('x')
    ylabel('y')
end