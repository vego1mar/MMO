function f = newton1d(fn, f_sym, x0, eps)
    syms x;
    f1 = fn(x0);
    derivative = diff(f_sym);
    f2 = vpa(subs(derivative, x, x0));
    x_prev = x0 - (f1 / f2);
    y = vpa(subs(f2, x, x_prev));
    disp([f1 f2 x_prev]);

    while y > eps
        f1 = fn(x_prev);
        f2 = vpa(subs(derivative, x, x_prev));
        x_next = x_prev - (f1 / f2);
        y = vpa(subs(f2, x, x_next));        
        x_prev = x_next;
        disp([f1 f2 x_next]);
    end
    
    x_next = x_prev;
    f = x_next;
end
