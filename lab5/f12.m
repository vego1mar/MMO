function f = f12(x)
    y = tan(-x.^2-3*x+4);
    f = 2 * exp(y);
end
