function eqns = bjt_beta(beta, i_b, i_c, i_e)
    % returns two equations describing the beta relation in a BJT
    eqns = [
        i_c == beta * i_b
        i_e == (beta + 1) * i_b
    ];
end