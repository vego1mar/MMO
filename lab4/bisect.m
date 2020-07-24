function f = bisect(fn, a, b, eps)
    tolerance = 2.0 * eps;

    while b - a >= tolerance
        pp = (b - a) / 4.0;
        x1 = a + pp;
        xm = (a + b) / 2.0;
        x2 = b - pp;
        %disp([x1 xm x2])
        
        if fn(x1) < fn(xm)
            b = xm;
        elseif fn(x2) < fn(xm)
            a = xm;
        else
            a = x1;
            b = x2;
        end
    end
    
    f = (b + a) / 2.0;
end
