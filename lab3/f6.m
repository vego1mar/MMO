function f = f6(x)
    a = (x(1).^4) .* 3;
    b = x(1).^2;
    c = (x(2).^2) .* 2;
    d = x(1) .* 2;
    f = a - b + c - d + x(2);
end
