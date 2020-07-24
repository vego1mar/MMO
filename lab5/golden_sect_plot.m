function f = golden_sect_plot(fn, a, b, eps)
    tolerance = 2.0 * eps;
    alfa = (sqrt(5.0) - 1.0) / 2.0;
    fplot(0, [a * 2, abs(b + 20)])
    title('f(it) = [x1, b-a, x2]')
    it = 0;
    hold on

    while (b - a) >= tolerance
        interval = b - a;
        x1 = b - alfa * interval;
        x2 = a + alfa * interval;
        plot(it, x1, 'go')
        plot(it, interval, 'rx')
        plot(it, x2, 'bo')
        it = it + 1;
        
        if vpa(fn(x1)) < vpa(fn(x2))
           b = x2;
        elseif vpa(fn(x1)) > vpa(fn(x2))
           a = x1;
        end
    end
    
    f = (b + a) / 2.0;
    plot(it, f, '^')
    hold off
end
