function f = f7(x)
    polynomial = 2*x.^2 - 3*x + 4;
    exponent = sin(polynomial);
    power = 2 * exp(exponent);
    f = power;
end
