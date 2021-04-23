function eqn = diffusion_resistance(beta, v_t, i_c, r_pi)
    % returns the diffusion resistance equation, where
    % i_c = collector current
    % r_pi = diffusion resistance
    % beta = common emitter current gain
    % v_t = thermal voltage at operating point
    eqn = i_c * r_pi == beta * v_t;
end