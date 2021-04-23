function optimized = solve2fn(sym_expr, axioms, in_terms_of, varargin)
    in_terms_of = formula(in_terms_of);
    expr = solve_for(sym_expr, axioms, in_terms_of);
    args = sym('arg', size(in_terms_of));
    for idx = 1:length(args)
        term_str_parts = split(string(in_terms_of(idx)), '(');
        term_name = term_str_parts{1};
        args(idx) = sym(term_name);
    end
    
    % if 'Vars' is supplied, substitute args for anything in the vars
    idx = find(strcmp(varargin, 'Vars'), 1);
    if ~isempty(idx)
        vars = varargin{idx + 1};
        subbed_vars = cell(1, length(vars));
        for var_idx = 1:length(vars)
            subbed_vars{var_idx} = subs(vars{var_idx}, in_terms_of, args);
        end
        varargin{idx + 1} = subbed_vars;
    end
    
    % produce the matlabFunction
    optimized = matlabFunction(subs(expr, in_terms_of, args), varargin{:});
end