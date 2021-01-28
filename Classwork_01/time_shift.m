%% Classwork 1 Problem 2.1
% David Thornton
% EE 384, SP 21
function y = time_shift(x, n, n_d)
    y = x(n - n_d);
end