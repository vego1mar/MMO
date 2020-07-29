function f = golden_sect_2(fn, a, b, eps, alfa, expected)
    tolerance = 2.0 * vpa(eps);
    iter = 0;
    file_id = fopen('golden_sect_2.out', 'wt');
    fprintf(file_id, ' it                x_optimum                abs(expected - x_optimum)');
    format = '\r\n%3d %.32f %.32f %.32f';
    
    while vpa(b - a) >= tolerance
        iter = iter + 1;
        interval = vpa(b - a);
        x1 = vpa(b) - alfa * interval;
        x2 = vpa(a) + alfa * interval;
        
        if vpa(fn(x1)) < vpa(fn(x2))
           b = x2;
           x_opt = vpa(b + a) / 2.0;
           difference = abs(vpa(expected) - x_opt);
           fprintf(file_id, format, iter, x_opt, difference);
        elseif vpa(fn(x1)) > vpa(fn(x2))
           a = x1;
           x_opt = vpa(b + a) / 2.0;
           difference = abs(vpa(expected) - x_opt);
           fprintf(file_id, format, iter, x_opt, difference);
        end
    end
    
    fprintf(file_id, '\n\r');
    fclose(file_id);
    f = vpa(b + a) / 2.0;
end