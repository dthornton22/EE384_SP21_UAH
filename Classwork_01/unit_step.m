%% Classwork 1 Problem 1.2
% David Thornton
% EE 384, SP 21
function y_n = unit_step(n_s, n1, n2)
    range = n1:n2;
    for i = 1:length(range)
        if range(i) >= n_s
            y_n(i) = 1; % this is the step
        else
            y_n(i) = 0;
        end
    end
end