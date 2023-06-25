function newton_method(f, df, x0, tol, max_iter)
    x = x0
    iter = 0
    while abs(f(x)) > tol && iter < max_iter
        x -= f(x) / df(x)
        iter += 1
    end
    return x
end

function f(x)
    return cos(x) - x
end

function df(x)
    return -sin(x) - 1
end