function [nested, args] = nest_symbolic_args(expr)
    if isequal(class(expr),'symfun')
        args = argnames(expr);
        % unsure if this will work for multiple arguments, probably not -
        % revisit this when that happens.
        nested = expr(args);
    else
        nested = expr;
        args = [];
    end
end