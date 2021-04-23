function answer = solve_for(expression, axioms, in_terms_of, varargin)
    % convert f(t) = 5 * x(t) -> f = 5 * x(t) so we can index into them
    axioms = formula(axioms);
    expr_args = argnames(expression);
    expr = formula(expression);
    
    assert(isvector(axioms), ...
        sprintf('expected axioms to be a vector. got %s', size(axioms)))
    
    % symbols found in all axioms
    variable_syms = setdiff(symvar(axioms), expr_args);
    
    % In order to use solve, we have to convert symbolic functions into
    % regular symbols. We'll do the reverse-substitution if we have any
    % unsolved terms (requested by in_terms_of) left at the end
    [axiom_symfuncs, axiom_syms] = symbolize_symfuncs(axioms);
    
    % TOO: perform polynomial coefficient equation separation where
    % possible
    axioms = subs(axioms, axiom_symfuncs, axiom_syms);
    expr = subs(expr, axiom_symfuncs, axiom_syms);
    
    syms_to_solve = [variable_syms axiom_syms];
    
    % strip variable_syms and axiom_sym_funcs of in_terms_of so that
    % we don't include them in syms_to_solve
    if exist('in_terms_of','var') && ~isempty(in_terms_of)
        % substitute axiom symfuncs out of ito
        in_terms_of = subs(in_terms_of, axiom_symfuncs, axiom_syms);
        % remove ito variables from solving requirements
        syms_to_solve = setdiff(syms_to_solve, symvar(in_terms_of));
    else
        
    end
    
    [simple_axioms, constants, simple_expr] = inline_constants(axioms, expr);
    
    % remove constants from variables we want to find
    syms_to_solve = setdiff(syms_to_solve, constants);
    
    if length(simple_axioms) < length(syms_to_solve)
        assert(f, "not enough equations to find the unknowns")
    end
    
    
    % sub the solutions into the expression to give the answer
    answer = simple_expr;
    
    % if not, simple_expr is already a constant!
    if ~isempty(syms_to_solve)
        % run the solver
        % TODO: handle multiple solutions elegantly
        solutions = solve(simple_axioms, syms_to_solve, varargin{:});
    
        % only not the case when only a single variable is unknown
        if isstruct(solutions)
            for name = fieldnames(solutions)'
                name_ = name{1};
                idx = syms_to_solve == name_;
                if any(idx)
                    answer = subs(answer, syms_to_solve(idx), solutions.(name_));
                end
            end
        end
    end
    
    % if we need to, reverse-substitute the in_terms_of_symfuncs too
    if exist('in_terms_of','var') && ~isempty(in_terms_of)
        answer = subs(answer, axiom_syms, axiom_symfuncs);
    end
end

function [simplified_eqns, constants, simplified_expr] = inline_constants(eqns, expr)
    % scan for constants and substitute them
    simplified_eqns = eqns;
    simplified_expr = expr;
    constants = [];
    for eqn = conj(eqns') % can't loop over axioms directly for some reason
        % if there's only one symvar here then this is a constant.
        % pop the axiom and subconststitute the value instead
        vars = symvar(eqn);
        if length(vars) == 1
            var = vars;
            without_eqn = simplified_eqns(simplified_eqns ~= eqn);
            val = solve(eqn);
            simplified_eqns = subs(without_eqn, var, val);
            simplified_expr = subs(simplified_expr, var, val);
            constants = [constants var];
        end
    end
    
    % if there were any changes, new constants might have emerged - do
    % another pass to ensure
    if length(simplified_eqns) < length(eqns)
        [simplified_eqns, constants2, simplified_expr] = inline_constants(simplified_eqns, simplified_expr);
        constants = [constants constants2];
    end
end

function [sym_funcs, sub_syms] = symbolize_symfuncs(eqns)
    
    sym_funcs = [findSymType(eqns, 'symfun') findSymType(eqns, 'diff') findSymType(eqns, 'int')];

    sub_syms = sym('x', size(sym_funcs));
end