function f = bisect_plot(fn, a, b, eps)
    tolerance = 2.0 * eps;
    it = 0;
    fplot(0, [0, abs(a + b) * 20])
    title('f(it) = [x1, xm, x2]')
    hold on

    while b - a >= tolerance
        it = it + 1;
        pp = (b - a) / 4.0;
        x1 = a + pp;
        xm = (a + b) / 2.0;
        x2 = b - pp;
        plot(it, x1, 'go')
        plot(it, xm, 'rx')
        plot(it, x2, 'bo')
        
        if fn(x1) < fn(xm)
            b = xm;
        elseif fn(x2) < fn(xm)
            a = xm;
        else
            a = x1;
            b = x2;
        end
    end
    
    it = it + 1;
    f = (b + a) / 2.0;
    plot(it, f, '^')
    hold off
end
