function f = newton1d_2(f_sym, x0, eps, expected)
    syms x;
    derivative1 = diff(f_sym);
    f1 = vpa(subs(derivative1, x, x0));
    derivative2 = diff(derivative1);
    f2 = vpa(subs(derivative2, x, x0));
    x_prev = x0 - (f1 / f2);
    y = vpa(subs(derivative1, x, x_prev));
    it = 1;
    
    file_id = fopen('newton1d_2.out', 'wt');
    fprintf(file_id, ' it               x_next                       |expected - x_next|');
    format = '\r\n%3d %.33f %.33f';
    difference = abs(expected - x_prev);
    fprintf(file_id, format, it, x_prev, difference);

    while abs(y) > eps
        f1 = vpa(subs(derivative1, x, x_prev));
        f2 = vpa(subs(derivative2, x, x_prev));
        x_next = x_prev - (f1 / f2);
        y = vpa(subs(derivative1, x, x_next));
        x_prev = x_next;
        difference = abs(expected - x_next);
        fprintf(file_id, format, it, x_next, difference);
        it = it + 1;
    end
    
    x_next = x_prev;
    f = x_next;
    fprintf(file_id, '\n\r');
    fclose(file_id);
end
