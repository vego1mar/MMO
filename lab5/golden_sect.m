function f = golden_sect(fn, a, b, eps)
    tolerance = 2.0 * eps;
    alfa = (sqrt(5.0) - 1.0) / 2.0;

    while (b - a) >= tolerance
        interval = b - a;
        x1 = b - alfa * interval;
        x2 = a + alfa * interval;
        disp([x1 x2 interval fn(x1) fn(x2)])
        
        if vpa(fn(x1)) < vpa(fn(x2))
           b = x2;
        elseif vpa(fn(x1)) > vpa(fn(x2))
           a = x1;
        end
    end
    
    f = (b + a) / 2.0;
end
