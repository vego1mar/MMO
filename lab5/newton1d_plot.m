function f = newton1d_plot(fn, f_sym, x0, eps)
    syms x;
    f1 = fn(x0);
    derivative = diff(f_sym);
    f2 = vpa(subs(derivative, x, x0));
    x_prev = x0 - (f1 / f2);
    y = vpa(subs(f2, x, x_prev));
    fplot(0, [x0 * 3, abs(x0 * 20)])
    title('f(it) = [f1, x_i, f2]')
    it = 0;
    hold on

    while y > eps
        f1 = fn(x_prev);
        f2 = vpa(subs(derivative, x, x_prev));
        x_next = x_prev - (f1 / f2);
        y = vpa(subs(f2, x, x_next));        
        x_prev = x_next;
        it = it + 1;
        plot(it, f1, 'go')
        plot(it, x_prev, 'rx')
        plot(it, f2, 'bo')
    end
    
    x_next = x_prev;
    f = x_next;
    plot(it, f, '^')
    hold off
end
