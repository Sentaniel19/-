function solve_cos_x_eq_x()
    a = 0.0
    b = 1.0
    epsilon = 1e-6
    
    while b - a > epsilon
        c = (a + b) / 2
        func_val = cos(c) - c
        
        if abs(func_val) < epsilon
            return c
        elseif func_val < 0
            a = c
        else
            b = c
        end
    end
    
    return (a + b) / 2
end