function f = golden_sect_2_plot(fn, a, b, eps, alfa, expected)
    tolerance = 2.0 * vpa(eps);
    it = 0;
    title(['f(it) = |expected - x[optimum]|, r=', num2str(alfa)])
    hold on
    
    while vpa(b - a) >= tolerance
        it = it + 1;
        interval = vpa(b - a);
        x1 = vpa(b) - alfa * interval;
        x2 = vpa(a) + alfa * interval;
        
        if vpa(fn(x1)) < vpa(fn(x2))
           b = x2;
           x_opt = vpa(b + a) / 2.0;
           difference = abs(vpa(expected) - x_opt);
           plot(it, difference, 'bx')
        elseif vpa(fn(x1)) > vpa(fn(x2))
           a = x1;
           x_opt = vpa(b + a) / 2.0;
           difference = abs(vpa(expected) - x_opt);
           plot(it, difference, 'rx')
        end
    end
    
    f = vpa(b + a) / 2.0;
    plot(it, f, 'g^')
    hold off
end
