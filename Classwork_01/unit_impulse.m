%% Classwork 1 Problem 1.1
% David Thornton
% EE 384, SP 21
function y_n = unit_impulse(n_p, n1, n2)
    range = n1:n2;
    for i = 1:length(range)
        if range(i) == n_p
            y_n(i) = 1; % this is the impulse
        else
            y_n(i) = 0;
        end
    end
end