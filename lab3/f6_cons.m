function [c, ceq] = f6_cons(x)
    c = x(1).^2 + 3*x(2).^2 - 1;
    ceq = [];
end
