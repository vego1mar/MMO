function f = newton1d_2_plot(f_sym, x0, eps, expected)
    syms x;
    derivative1 = diff(f_sym);
    f1 = vpa(subs(derivative1, x, x0));
    derivative2 = diff(derivative1);
    f2 = vpa(subs(derivative2, x, x0));
    x_prev = x0 - (f1 / f2);
    y = vpa(subs(derivative1, x, x_prev));
    it = 1;
    
    difference = abs(expected - x_prev);    
    title(['f(it) = |expected - x[next]|, x0=', num2str(x0)]);
    hold on;
    plot(it, difference, 'rx')
    
    while abs(y) > eps
        f1 = vpa(subs(derivative1, x, x_prev));
        f2 = vpa(subs(derivative2, x, x_prev));
        x_next = x_prev - (f1 / f2);
        y = vpa(subs(derivative1, x, x_next));
        x_prev = x_next;
        difference = abs(expected - x_next);
        it = it + 1;
        plot(it, difference, 'bx')
    end
    
    x_next = x_prev;
    f = x_next;
    plot(it, f, 'g^')
    hold off;
end
